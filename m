Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD5E184771
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 14:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbgCMNGs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 09:06:48 -0400
Received: from smtprelay0180.hostedemail.com ([216.40.44.180]:38090 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726479AbgCMNGs (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Mar 2020 09:06:48 -0400
X-Greylist: delayed 445 seconds by postgrey-1.27 at vger.kernel.org; Fri, 13 Mar 2020 09:06:47 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 88E14180001DC
        for <linux-next@vger.kernel.org>; Fri, 13 Mar 2020 12:59:23 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id CFC0318010A45;
        Fri, 13 Mar 2020 12:59:21 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:800:960:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:1801:2393:2525:2560:2563:2682:2685:2693:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3865:3866:3867:3870:3871:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4605:5007:7903:8985:9025:10004:10400:10848:11026:11232:11233:11473:11657:11658:11914:12043:12050:12297:12438:12555:12740:12760:12895:12986:13161:13229:13439:14096:14097:14180:14181:14394:14659:14721:21060:21080:21433:21451:21611:21627:21811:30054:30060:30070:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: idea77_3485785e1df18
X-Filterd-Recvd-Size: 3039
Received: from XPS-9350.home (unknown [47.151.143.254])
        (Authenticated sender: joe@perches.com)
        by omf20.hostedemail.com (Postfix) with ESMTPA;
        Fri, 13 Mar 2020 12:59:20 +0000 (UTC)
Message-ID: <d67ed65313f3a1579c1cf88348e8853c5cca4598.camel@perches.com>
Subject: [PATCH] drm/amd/powerplay: Move fallthrough; into containing
 #ifdef/#endif
From:   Joe Perches <joe@perches.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Fri, 13 Mar 2020 05:57:37 -0700
In-Reply-To: <20200313205748.03d30145@canb.auug.org.au>
References: <20200313205748.03d30145@canb.auug.org.au>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The automated conversion of /* fallthrough */ comments converted
a comment outside of an #ifdef/#endif case block that should be
inside the block.

Move the fallthrough inside the block to silence the warning.

Signed-off-by: Joe Perches <joe@perches.com>
---

On Fri, 2020-03-13 at 20:57 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the amdgpu tree, today's linux-next build (powerpc
> allyesconfig) produced this warning:
> 
> In file included from include/linux/compiler_types.h:59,
>                  from <command-line>:
> drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/smu7_hwmgr.c: In function 'smu7_request_link_speed_change_before_state_change':
> include/linux/compiler_attributes.h:200:41: warning: statement will never be executed [-Wswitch-unreachable]
>   200 | # define fallthrough                    __attribute__((__fallthrough__))
>       |                                         ^~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/smu7_hwmgr.c:3706:4: note: in expansion of macro 'fallthrough'
>  3706 |    fallthrough;
>       |    ^~~~~~~~~~~
> 
> Introduced by commit
> 
>   e86efa063cd1 ("AMD POWERPLAY: Use fallthrough;")

This is also one of the #ifdef/#endif pairs
where the fallthrough is outside of the #endif.

https://lore.kernel.org/lkml/cover.1584040050.git.joe@perches.com/

Here is a delta patch for this.
Let me know if another form is needed.

 drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
index fc5236c..774048 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
@@ -3702,8 +3702,8 @@ static int smu7_request_link_speed_change_before_state_change(
 		case PP_PCIEGen2:
 			if (0 == amdgpu_acpi_pcie_performance_request(hwmgr->adev, PCIE_PERF_REQ_GEN2, false))
 				break;
-#endif
 			fallthrough;
+#endif
 		default:
 			data->force_pcie_gen = smu7_get_current_pcie_speed(hwmgr);
 			break;
-- 
2.24.0


