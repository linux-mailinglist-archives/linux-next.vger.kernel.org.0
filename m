Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB1EE6A6E
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2019 02:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729211AbfJ1BN7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 27 Oct 2019 21:13:59 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:48472 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729206AbfJ1BN7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 27 Oct 2019 21:13:59 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x9S1DsWb032507;
        Mon, 28 Oct 2019 10:13:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x9S1DsWb032507
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1572225235;
        bh=EfLEmTvlm/lG3uBmRFOrAGC4amACh1c7WhoFmdPquZQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=T5Ij2Z7/wrylG14MkqDiGT7nxBMAAKVyzvPW+LdXqmIixiQdJf5AtAK4xOiis1x30
         t3U0yKm4t2ZTM1jnZ8eLwFcn6qUXvWoNqEMpP4WE46hJiXghK5Lxq6mExrukMVHjSd
         3qRit1Dm7VKvWoXpFubC2zX0IBvW5Jn3h5y6POK149Jt0WZ6uGZzRz2g6GMGAp1AZL
         Pfs70r7/JLO0KMd8AuuxS1BKhRisKE6E0Jzzo+0p+X8cvqgk10FYAGGTKYKrMUpUze
         8mWOYbFCTX7J0YU3itTe+0QDJ4OAOTByzUf8VBGqgLKYD4YDkT9T1lVzBID4fZ+WKX
         cvqzXiEzcnHrA==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id k1so2684639vsm.0;
        Sun, 27 Oct 2019 18:13:54 -0700 (PDT)
X-Gm-Message-State: APjAAAVRKHKKX2Dr9vdqIVzGimR5XPYHn0tkrkrWgOIz6xym4OhtCJaa
        B10WAHVCajrmm7J6vTpt1XBUSXyRcI1kP9W61p0=
X-Google-Smtp-Source: APXvYqyr0LevgJ+Ag2O+ArhDzyh7iTWrIUjn66Lsp9ynwMy1czakgrO35QtlQOeJbZe6f+RnnOZ8aym5cgT7C1jAfHg=
X-Received: by 2002:a67:e290:: with SMTP id g16mr7786820vsf.54.1572225233664;
 Sun, 27 Oct 2019 18:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191028115740.791bdeba@canb.auug.org.au>
In-Reply-To: <20191028115740.791bdeba@canb.auug.org.au>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 28 Oct 2019 10:13:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS-k6JnYBqzFHXd5D2LrtF111ch-zqkkCaygTGfKaY5_A@mail.gmail.com>
Message-ID: <CAK7LNAS-k6JnYBqzFHXd5D2LrtF111ch-zqkkCaygTGfKaY5_A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 28, 2019 at 9:57 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the amdgpu tree got a conflict in:
>
>   drivers/gpu/drm/amd/display/dc/dcn20/Makefile
>
> between commit:
>
>   54b8ae66ae1a ("kbuild: change *FLAGS_<basetarget>.o to take the path relative to $(obj)")
>
> from Linus' tree and commits:
>
>   4f952528add3 ("drm/amdgpu: fix stack alignment ABI mismatch for Clang")
>   971463bea55c ("drm/amdgpu: fix stack alignment ABI mismatch for GCC 7.1+")
>   101d09f07966 ("drm/amdgpu: enable -msse2 for GCC 7.1+ users")
>
> from the amdgpu tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.


I believe subsystems should queue up patches
against -rc1 or a later tag.

Developing based on an older version
causes unneeded conflicts like this.




> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> index ddb8d5649e79,be3a614963c6..000000000000
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
> @@@ -10,16 -10,21 +10,21 @@@ ifdef CONFIG_DRM_AMD_DC_DSC_SUPPOR
>   DCN20 += dcn20_dsc.o
>   endif
>
> - ifneq ($(call cc-option, -mpreferred-stack-boundary=4),)
> -       cc_stack_align := -mpreferred-stack-boundary=4
> - else ifneq ($(call cc-option, -mstack-alignment=16),)
> -       cc_stack_align := -mstack-alignment=16
> - endif
>  -CFLAGS_dcn20_resource.o := -mhard-float -msse
> ++CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o := -mhard-float -msse
>
> - CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o := -mhard-float -msse $(cc_stack_align)
> + ifdef CONFIG_CC_IS_GCC
> + ifeq ($(call cc-ifversion, -lt, 0701, y), y)
> + IS_OLD_GCC = 1
> + endif
> + endif
>
> - ifdef CONFIG_CC_IS_CLANG
> + ifdef IS_OLD_GCC
> + # Stack alignment mismatch, proceed with caution.
> + # GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
> + # (8B stack alignment).
>  -CFLAGS_dcn20_resource.o += -mpreferred-stack-boundary=4
> ++CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o += -mpreferred-stack-boundary=4
> + else
>  -CFLAGS_dcn20_resource.o += -msse2
>  +CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o += -msse2
>   endif
>
>   AMD_DAL_DCN20 = $(addprefix $(AMDDALPATH)/dc/dcn20/,$(DCN20))



-- 
Best Regards
Masahiro Yamada
