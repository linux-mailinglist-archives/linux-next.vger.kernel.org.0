Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F43B7CCF11
	for <lists+linux-next@lfdr.de>; Tue, 17 Oct 2023 23:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjJQVTy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Oct 2023 17:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjJQVTx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Oct 2023 17:19:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E224C4
        for <linux-next@vger.kernel.org>; Tue, 17 Oct 2023 14:19:52 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F627C433C7;
        Tue, 17 Oct 2023 21:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697577591;
        bh=vRZpg6PdpL3MhE26E/oC79Qb79senuuvZ43lnvsq0nQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N90iWyBrofTafsz5IKzp3zu0oZh0l/5hfUL6JLJT+VcUAJjm8RyYqFeCY9i5oR5BS
         LYXQl50He5hlt8Duo6+20IfNNieFjn0XGI9LetezJzpAefOlqvMvwTAgTjvTtm1l1T
         ShECQmXtBGaKoF0rt+aJbjm8vH8XsKqpiyZu1M/yDIEaJqryjEWoSChe40mbbRPVPI
         VmyruZKlKAZ1tsrc3trQo3ecmeyybmI6690EYrdrQTtWyg98gPWFrT5RGBIbimBl4W
         H+G7SdTr9VY5wrI2IGGdjDhcatHxpRFlBWRqkVPhWokYFyZmJhscO9Ww38a5cKjIEq
         SEibGCVx0D2eA==
Date:   Tue, 17 Oct 2023 14:19:49 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexander.deucher@amd.com>,
        Chaitanya Dhere <chaitanya.dhere@amd.com>,
        Roman Li <roman.li@amd.com>, linux-next@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
        "Mahfooz, Hamza" <hamza.mahfooz@amd.com>
Subject: Re: [PATCH 0/2] Reduce stack size for DML2
Message-ID: <20231017211949.GA2311196@dev-arch.thelio-3990X>
References: <20231016142031.241912-1-Rodrigo.Siqueira@amd.com>
 <20231017172231.GA2348194@dev-arch.thelio-3990X>
 <af5900a6-e3ae-4cf1-9a29-89484f411a1c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af5900a6-e3ae-4cf1-9a29-89484f411a1c@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 17, 2023 at 11:45:42AM -0600, Rodrigo Siqueira Jordao wrote:
> Hi Nathan,
> (+Hamza)
> 
> First of all, thanks a lot for your feedback. You can see my comments
> inline.
> 
> On 10/17/23 11:22, Nathan Chancellor wrote:
> > Hi Rodrigo,
> > 
> > On Mon, Oct 16, 2023 at 08:19:16AM -0600, Rodrigo Siqueira wrote:
> > > Stephen discovers a stack size issue when compiling the latest amdgpu
> > > code with allmodconfig. This patchset addresses that issue by splitting
> > > a large function into two smaller parts.
> > > 
> > > Thanks
> > > Siqueira
> > > 
> > > Rodrigo Siqueira (2):
> > >    drm/amd/display: Reduce stack size by splitting function
> > >    drm/amd/display: Fix stack size issue on DML2
> > > 
> > >   .../amd/display/dc/dml2/display_mode_core.c   | 3289 +++++++++--------
> > >   1 file changed, 1653 insertions(+), 1636 deletions(-)
> > > 
> > > -- 
> > > 2.42.0
> > > 
> > 
> > This series appears in -next as commit c587ee30f376 ("drm/amd/display:
> > Reduce stack size by splitting function"); while it may help stack usage
> > for GCC, clang still suffers. All clang versions that the kernel
> > supports show a warning for dml_prefetch_check(), the following is with
> > LLVM 17.0.2 from kernel.org [1].
> > 
> >    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6263:13: error: stack frame size (2520) exceeds limit (2048) in 'dml_prefetch_check' [-Werror,-Wframe-larger-than]
> >     6263 | static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
> >          |             ^
> > 
> > With clang 18.0.0 (tip of tree) and 15.0.7, I see:
> > 
> >    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:8277:6: error: stack frame size (2056) exceeds limit (2048) in 'dml_core_mode_programming' [-Werror,-Wframe-larger-than]
> >     8277 | void dml_core_mode_programming(struct display_mode_lib_st *mode_lib, const struct dml_clk_cfg_st *clk_cfg)
> >          |      ^
> > 
> > For what it's worth, building with GCC 13.2.0 with a slighly lower
> > -Wframe-larger-than value reveals that dml_prefetch_check() is right at
> > the current limit and the stack usage of dml_core_mode_programming()
> > when built with GCC is not too far of clang's, so it seems like there
> > should be a more robust set of fixes, such as the ones that I have
> > already done for older generations of this code.
> > 
> >    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In function 'dml_prefetch_check':
> >    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6705:1: error: the frame size of 2048 bytes is larger than 1800 bytes [-Werror=frame-larger-than=]
> >     6705 | }
> >          | ^
> > 
> >    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In function 'dml_core_mode_programming':
> >    drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:9893:1: error: the frame size of 1880 bytes is larger than 1800 bytes [-Werror=frame-larger-than=]
> >     9893 | } // dml_core_mode_programming
> >          | ^
> > 
> > 41012d715d5d drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline for stack usage
> > 21485d3da659 drm/amd/display: Reduce number of arguments of dml31's CalculateFlipSchedule()
> > 37934d4118e2 drm/amd/display: Reduce number of arguments of dml31's CalculateWatermarksAndDRAMSpeedChangeSupport()
> > a3fef74b1d48 drm/amd/display: Reduce number of arguments of dml32_CalculatePrefetchSchedule()
> > c4be0ac987f2 drm/amd/display: Reduce number of arguments of dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport()
> > 25ea501ed85d drm/amd/display: Reduce number of arguments of dml314's CalculateFlipSchedule()
> > ca07f4f5a98b drm/amd/display: Reduce number of arguments of dml314's CalculateWatermarksAndDRAMSpeedChangeSupport()
> > 
> > It would be really nice if these would somehow make it back to the
> > original sources so that we stop going through this every time a new
> > version of this code shows up.
> 
> I'm familiar with that approach of reducing the stack size. Correct me if
> I'm wrong, but the idea can be summarized as:
> 
> 1. Move the local variable to a new struct.
> 2. Add the new struct as a reference to the main struct.
> 3. Update the function to use the elements in those structs.
> 
> I used this approach a lot in the past to reduce the stack size. However, I
> think this case is a little bit different. The target function is

Right, I would agree with this assessment.

> display_mode_core, which does not have a lot of local variables, as you can
> see in the below link:
> 
> https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c#L6212

Based on my experience in the past and my limited knowledge of LLVM
internals, I think this is likely caused by excessive inlining combined
with several functions that take a high number of parameters, which
means the compiler has to spill passing parameters to the stack when it
runs out of registers. The majority of the commits I mentioned above
were focused on reducing the number of parameters to various functions,
which showed the largest stack usage wins.

> > I thought that AMD has started testing
> > with clang, how were these warnings not caught before the code was
> > merged? If you are unable to look into these warnings, I can try to
> > double back to this once I look into the other fires in -next...
> 
> Yeah, our CI uses GCC and Clang, but the version provided by the distro.
> Additionally, we do not use allmodconfig per patch; we use a custom config
> file to keep the build time under control.

That is understandable. I am not sure how much control over the build
command you have with your target or how much spare capacity you are
working with but it would be nice if you could run allmodconfig and just
the AMDGPU folder target, which would catch a majority of problems. For
example, this problem reproduces for me with just:

  $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 allmodconfig drivers/gpu/drm/amd/amdgpu/

which should not take that long, even on a relatively slow machine. One
of my test machines has a Ryzen 3 4300G (4C/8T), which did that command
in around 3 minutes, and I assume you have access to better machines
than that.

> Anyway, we tried to understand why this issue only showed up with the
> allmodconfig, and Hamza figured out that enabling the KCSAN option in our
> config file exposes those stack issues. I don't know the details behind
> KCSAN, but it looks like it will expand the stack size in the functions.
> 
> Maybe can you check in your side if disable KCSAN also fix the issues on
> clang? Do you have any other suggestion on how I can try to reduce the stack
> size in this particular case?

If CONFIG_KASAN, CONFIG_KCSAN, and CONFIG_KMSAN are disabled, I see no
-Wframe-larger-than warnings (I tested with KCONFIG_ALLCONFIG). While I
would personally like to see these disabled with allmodconfig, that is
not the current reality. We are also looking into reducing stack usage
in clang but that will only help newer releases. I think looking into
reducing the number of parameters of various functions called throughout
dml_prefetch_check() and dml_core_mode_programming() is likely the right
way to solve this, or at least the most reliable methods.

Cheers,
Nathan
