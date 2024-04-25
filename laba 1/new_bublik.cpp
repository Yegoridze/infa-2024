#include <set>
#include <gmsh.h>
#include <math.h>
#include <stdio.h>
#include <iostream>

int inner[4][4] = { 0 };
int outer[4][4] = { 0 };
int circle[4] = { 0 };
int axis_big[4];
int axis_small[4];

int outer_circles[4][4];
int inner_circles[4][4];
int grand_outer_circles[4][4];
int grand_inner_circles[4][4];

int outer_surface[4][4];
int inner_surface[4][4];


int n = 4;

int main(int argc, char** argv)
{
    gmsh::initialize();
    gmsh::model::add("new_bublik");

    double lc = 1;
    double R = 10, r_in = 1, r_out = 2;
    double x, y, z;

    int highest = gmsh::model::geo::addPoint(0, 0, r_out, lc);
    int high = gmsh::model::geo::addPoint(0, 0, r_in, lc);
    int mid = gmsh::model::geo::addPoint(0, 0, 0, lc);
    int low = gmsh::model::geo::addPoint(0, 0, -r_in, lc);
    int lowest = gmsh::model::geo::addPoint(0, 0, -r_out, lc); // точки на главной оси, чтобы удобно было закруглять
    axis_big[0] = highest;
    axis_big[1] = mid;
    axis_big[2] = lowest;
    axis_big[3] = mid;
    axis_small[0] = high;
    axis_small[1] = mid;
    axis_small[2] = low;
    axis_small[3] = mid;

    for (int chas = 0; chas < n; chas++) {                                                       //точки внутреннего круга для удобства проведения кривых
        x = R * round(sin(chas * M_PI * 2 / n));                                                    //chas - угол глобальный (взгляд сверху)
        y = R * round(cos(chas * M_PI * 2 / n));
        circle[chas] = gmsh::model::geo::addPoint(x, y, 0, lc); 
    }

    for (int chas = 0; chas < n; chas++) {                                                          //точки внутренней полости, chas - угол глобальный (взгляд сверху)
        for (int angle = 0; angle < n; angle++) {                                                   //angle - угол при вгляде на полость сбоку
            x = (R + r_in * round(sin(angle * M_PI * 2 / n))) * round(sin(chas * M_PI * 2 / n));
            y = (R + r_in * round(sin(angle * M_PI * 2 / n))) * round(cos(chas * M_PI * 2 / n));
            z = r_in * round(cos(angle * M_PI * 2 / n));
            inner[chas][angle] = gmsh::model::geo::addPoint(x, y, z, lc);
        }
    }
    for (int chas = 0; chas < n; chas++) {                                                          //точки внешней поверхности, chas - угол глобальный (взгляд сверху)
        for (int out = 0; out < n; out++) {                                                         //out - угол при вгляде на полость сбоку
            x = (R + r_out * round(sin(out * M_PI * 2 / n))) * round(sin(chas * M_PI * 2 / n));
            y = (R + r_out * round(sin(out * M_PI * 2 / n))) * round(cos(chas * M_PI * 2 / n));
            z = r_out * round(cos(out * M_PI * 2 / n));
            outer[chas][out] = gmsh::model::geo::addPoint(x, y, z, lc);
        }
    }

    for (int chas = 0; chas < n; chas++) {
        for (int angle = 0; angle < n; angle++) {
            inner_circles[chas][angle] = gmsh::model::geo::addCircleArc(
                inner[chas][angle],
                circle[chas],
                inner[chas][(angle + 1) % n]);
            outer_circles[chas][angle] = gmsh::model::geo::addCircleArc(
                outer[chas][angle],
                circle[chas],
                outer[chas][(angle + 1) % n]);
            grand_outer_circles[chas][angle] = gmsh::model::geo::addCircleArc(
                outer[chas][angle],
                axis_big[angle],
                outer[(chas + 1) % n][angle]);
            grand_inner_circles[chas][angle] = gmsh::model::geo::addCircleArc(
                inner[chas][angle],
                axis_small[angle],
                inner[(chas + 1) % n][angle]);
        }
    }

    for (int chas = 0; chas < 4; chas++) {
        for (int angle = 0; angle < 4; angle++) {
            outer_surface[chas][angle] = gmsh::model::geo::addCurveLoop({
                outer_circles[chas][angle],
                grand_outer_circles[chas][(angle + 1) % n],
                -outer_circles[(chas + 1) % n][angle],
                -grand_outer_circles[chas][angle] });

            gmsh::model::geo::addSurfaceFilling({ outer_surface[chas][angle] }, outer_surface[chas][angle]);

            inner_surface[chas][angle] = gmsh::model::geo::addCurveLoop({
                inner_circles[chas][angle],
                grand_inner_circles[chas][(angle + 1) % n],
                -inner_circles[(chas + 1) % n][angle],
                -grand_inner_circles[chas][angle] });

            gmsh::model::geo::addSurfaceFilling({ inner_surface[chas][angle] }, inner_surface[chas][angle]);
        }
    }
    

    std::vector<int> all_surfaces;
    for (int chas = 0; chas < 4; chas++) {
        for (int angle = 0; angle < 4; angle++) {
            all_surfaces.push_back(outer_surface[chas][angle]);
        }
    }
    for (int chas = 0; chas < 4; chas++) {
        for (int angle = 0; angle < 4; angle++) {
            all_surfaces.push_back(-inner_surface[chas][angle]);
        }
    }

    gmsh::model::geo::addSurfaceLoop(all_surfaces, 1);
    gmsh::model::geo::addVolume({ 1 });


    gmsh::model::geo::synchronize();

    gmsh::model::mesh::generate(3);

    gmsh::write("new_bublik.msh");

    std::set<std::string> args(argv, argv + argc);
    if (!args.count("-nopopup")) gmsh::fltk::run();

    gmsh::finalize();

    return 0;
}