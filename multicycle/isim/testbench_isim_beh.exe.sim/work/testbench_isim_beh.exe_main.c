/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002323507068_3092946469_init();
    work_m_00000000001010553667_3090249552_init();
    work_m_00000000001010553667_4131947671_init();
    work_m_00000000000454849756_0890691289_init();
    work_m_00000000000737646523_2825592672_init();
    work_m_00000000001973725573_2858489435_init();
    work_m_00000000002488741118_2931155317_init();
    work_m_00000000001306512438_0878684766_init();
    work_m_00000000003449849697_2732073534_init();
    work_m_00000000003449849697_4257344850_init();
    work_m_00000000001996340065_1558133160_init();
    work_m_00000000001369922898_3248494240_init();
    work_m_00000000003310059677_2998843018_init();
    work_m_00000000000221342915_1847782055_init();
    work_m_00000000003271356336_2282980863_init();
    work_m_00000000003070301745_0300432699_init();
    work_m_00000000000379688728_3027548060_init();
    work_m_00000000003676393174_3823007873_init();
    work_m_00000000002226789488_2381739659_init();
    work_m_00000000004257426191_1949178628_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000004257426191_1949178628");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
