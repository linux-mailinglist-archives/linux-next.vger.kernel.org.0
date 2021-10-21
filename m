Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 392F7435D11
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 10:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbhJUImd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 04:42:33 -0400
Received: from mga05.intel.com ([192.55.52.43]:48807 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231268AbhJUIma (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Oct 2021 04:42:30 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="315184261"
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; 
   d="scan'208";a="315184261"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2021 01:40:14 -0700
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; 
   d="scan'208";a="495028875"
Received: from ssuryana-mobl.ger.corp.intel.com (HELO localhost) ([10.249.45.34])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2021 01:40:07 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Vlastimil Babka <vbabka@suse.cz>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, dri-devel@lists.freedesktop.org,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Marco Elver <elver@google.com>,
        Vijayanand Jitta <vjitta@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Oliver Glitta <glittao@gmail.com>,
        Imran Khan <imran.f.khan@oracle.com>,
        lkft-triage@lists.linaro.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [next] [dragonboard 410c] Unable to handle kernel paging request at virtual address 00000000007c4240
In-Reply-To: <80ab567d-74f3-e14b-3c30-e64bbd64b354@suse.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CA+G9fYv3jAjBKHM-CjrMzNgrptx-rpYVmGaD39OBiBeuz7osfg@mail.gmail.com> <80ab567d-74f3-e14b-3c30-e64bbd64b354@suse.cz>
Date:   Thu, 21 Oct 2021 11:40:03 +0300
Message-ID: <87fssuojoc.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 21 Oct 2021, Vlastimil Babka <vbabka@suse.cz> wrote:
> On 10/20/21 20:24, Naresh Kamboju wrote:
>> Following kernel crash noticed on linux next 20211020 tag.
>> while booting on arm64 architecture dragonboard 410c device.
>> 
>> I see the following config is enabled in 20211020 tag builds.
>> CONFIG_STACKDEPOT=y
>> 
>> Crash log,
>> [   18.583097] Unable to handle kernel paging request at virtual
>> address 00000000007c4240
>> [   18.583521] Mem abort info:
>> [   18.590286]   ESR = 0x96000004
>> [   18.592920]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [   18.596103]   SET = 0, FnV = 0
>> [   18.601512]   EA = 0, S1PTW = 0
>> [   18.604384]   FSC = 0x04: level 0 translation fault
>> [   18.607447] Data abort info:
>> [   18.612296]   ISV = 0, ISS = 0x00000004
>> [   18.615451]   CM = 0, WnR = 0
>> [   18.618990] user pgtable: 4k pages, 48-bit VAs, pgdp=000000008b4c7000
>> [   18.622054] [00000000007c4240] pgd=0000000000000000, p4d=0000000000000000
>> [   18.628974] Internal error: Oops: 96000004 [#1] SMP
>> [   18.635073] Modules linked in: adv7511 cec snd_soc_lpass_apq8016
>> snd_soc_lpass_cpu snd_soc_lpass_platform snd_soc_msm8916_digital
>> qcom_camss qrtr snd_soc_apq8016_sbc videobuf2_dma_sg qcom_pon
>> qcom_spmi_vadc snd_soc_qcom_common qcom_q6v5_mss qcom_vadc_common
>> rtc_pm8xxx qcom_spmi_temp_alarm msm qcom_pil_info v4l2_fwnode
>> qcom_q6v5 snd_soc_msm8916_analog qcom_sysmon qcom_common v4l2_async
>> qnoc_msm8916 qcom_rng gpu_sched qcom_glink_smem venus_core
>> videobuf2_memops icc_smd_rpm qmi_helpers drm_kms_helper v4l2_mem2mem
>> mdt_loader display_connector i2c_qcom_cci videobuf2_v4l2 crct10dif_ce
>> videobuf2_common socinfo drm rmtfs_mem fuse
>> [   18.672948] CPU: 0 PID: 178 Comm: kworker/u8:3 Not tainted
>> 5.15.0-rc6-next-20211020 #1
>> [   18.695000] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
>> [   18.695012] Workqueue: events_unbound deferred_probe_work_func
>> [   18.695033] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   18.715282] pc : __stack_depot_save+0x13c/0x4e0
>> [   18.722130] lr : stack_depot_save+0x14/0x20
>> [   18.726641] sp : ffff800014a23500
>> [   18.730801] x29: ffff800014a23500 x28: 00000000000f8848 x27: ffff800013acdf68
>> [   18.734294] x26: 0000000000000000 x25: 00000000007c4240 x24: ffff800014a23780
>> [   18.741413] x23: 0000000000000008 x22: ffff800014a235b8 x21: 0000000000000008
>> [   18.748530] x20: 00000000c32f8848 x19: ffff00001038cc18 x18: ffffffffffffffff
>> [   18.755649] x17: ffff80002d9f8000 x16: ffff800010004000 x15: 000000000000c426
>> [   18.762767] x14: 0000000000000000 x13: ffff800014a23780 x12: 0000000000000000
>> [   18.769885] x11: ffff00001038cc80 x10: ffff8000136e9ba0 x9 : ffff800014a235f4
>> [   18.777003] x8 : 0000000000000001 x7 : 00000000b664620b x6 : 0000000011a58b4a
>> [   18.784121] x5 : 000000001aa43464 x4 : 000000009e7d8b67 x3 : 0000000000000001
>> [   18.791239] x2 : 0000000000002800 x1 : ffff800013acd000 x0 : 00000000f2d429d8
>> [   18.798358] Call trace:
>> [   18.805451]  __stack_depot_save+0x13c/0x4e0
>> [   18.807716]  stack_depot_save+0x14/0x20
>> [   18.811881]  __drm_stack_depot_save+0x44/0x70 [drm]
>> [   18.815710]  modeset_lock.part.0+0xe0/0x1a4 [drm]
>> [   18.820571]  drm_modeset_lock_all_ctx+0x2d4/0x334 [drm]
>
> This stack_depot_save path appears to be new from Jani's commit
> cd06ab2fd48f ("drm/locking: add backtrace for locking contended locks
> without backoff")
> And there's a semantic conflict with my patch in mmotm:
> - sha1 (valid only in next-20211020) 5e6d063de5cd ("lib/stackdepot: allow
> optional init and stack_table allocation by kvmalloc()")
> - lore: https://lore.kernel.org/all/20211013073005.11351-1-vbabka@suse.cz/
> - patchwork: https://patchwork.freedesktop.org/series/95549/#rev3
>
> With my patch, to-be callers of stack_depot_save() need to call
> stack_depot_init() at least once, to avoid unnecessary runtime overhead
> otherwise I have added that calls into three DRM contexts in my patch, but
> didn't see cd06ab2fd48f yet at the time.

Auch, I did see your changes fly by, but overlooked this type of
conflict with my patch. Sorry for the trouble.

> This one seems a bit more tricky and I could really use some advice.
> cd06ab2fd48f adds stackdepot usage to drm_modeset_lock which itself has a
> number of different users and requiring those to call stack_depot_init()
> would be likely error prone. Would it be ok to add the call of
> stack_depot_init() (guarded by #ifdef CONFIG_DRM_DEBUG_MODESET_LOCK) to
> drm_modeset_lock_init()? It will do a mutex_lock()/unlock(), and kvmalloc()
> on first call.
> I don't know how much of hotpath this is, but hopefully should be acceptable
> in debug config. Or do you have better suggestion? Thanks.

I think that should be fine.

Maybe add __drm_stack_depot_init() in the existing #if
IS_ENABLED(CONFIG_DRM_DEBUG_MODESET_LOCK), similar to the other
__drm_stack_depot_*() functions, with an empty stub for
CONFIG_DRM_DEBUG_MODESET_LOCK=n, and call it unconditionally in
drm_modeset_lock_init().

> Then we have to figure out how to order a fix between DRM and mmotm...

That is the question! The problem exists only in the merge of the
two. On current DRM side stack_depot_init() exists but it's __init and
does not look safe to call multiple times. And obviously my changes
don't exist at all in mmotm.

I guess one (admittedly hackish) option is to first add a patch in
drm-next (or drm-misc-next) that makes it safe to call
stack_depot_init() multiple times in non-init context. It would be
dropped in favour of your changes once the trees get merged together.

Or is there some way for __drm_stack_depot_init() to detect whether it
should call stack_depot_init() or not, i.e. whether your changes are
there or not?


BR,
Jani.


>
>> [   18.825435]  drm_client_firmware_config.constprop.0.isra.0+0xc0/0x5d0 [drm]
>> [   18.830478]  drm_client_modeset_probe+0x328/0xbb0 [drm]
>> [   18.837413]  __drm_fb_helper_initial_config_and_unlock+0x54/0x5b4
>> [drm_kms_helper]
>> [   18.842633]  drm_fb_helper_initial_config+0x5c/0x70 [drm_kms_helper]
>> [   18.850266]  msm_fbdev_init+0x98/0x100 [msm]
>> [   18.856767]  msm_drm_bind+0x650/0x720 [msm]
>> [   18.861021]  try_to_bring_up_master+0x230/0x320
>> [   18.864926]  __component_add+0xc8/0x1c4
>> [   18.869435]  component_add+0x20/0x30
>> [   18.873253]  mdp5_dev_probe+0xe0/0x11c [msm]
>> [   18.877077]  platform_probe+0x74/0xf0
>> [   18.881328]  really_probe+0xc4/0x470
>> [   18.884883]  __driver_probe_device+0x11c/0x190
>> [   18.888534]  driver_probe_device+0x48/0x110
>> [   18.892786]  __device_attach_driver+0xa4/0x140
>> [   18.896869]  bus_for_each_drv+0x84/0xe0
>> [   18.901380]  __device_attach+0xe4/0x1c0
>> [   18.905112]  device_initial_probe+0x20/0x30
>> [   18.908932]  bus_probe_device+0xac/0xb4
>> [   18.913098]  deferred_probe_work_func+0xc8/0x120
>> [   18.916920]  process_one_work+0x280/0x6a0
>> [   18.921780]  worker_thread+0x80/0x454
>> [   18.925683]  kthread+0x178/0x184
>> [   18.929326]  ret_from_fork+0x10/0x20
>> [   18.932634] Code: d37d4e99 92404e9c f940077a 8b190359 (c8dfff33)
>> [   18.936203] ---[ end trace 3e289b724840642d ]---
>> 
>> Full log,
>> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20211020/testrun/6177937/suite/linux-log-parser/test/check-kernel-oops-3786583/log
>> https://lkft.validation.linaro.org/scheduler/job/3786583#L2549
>> 
>> Build config:
>> https://builds.tuxbuild.com/1zlLlQrUyHVr1MQ1gcler3dKaE6/config
>> 
>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>> 
>> steps to reproduce:
>> 1) https://builds.tuxbuild.com/1zlLlQrUyHVr1MQ1gcler3dKaE6/tuxmake_reproducer.sh
>> 2) Boot db410c device
>> 
>> --
>> Linaro LKFT
>> https://lkft.linaro.org
>> 
>

-- 
Jani Nikula, Intel Open Source Graphics Center
