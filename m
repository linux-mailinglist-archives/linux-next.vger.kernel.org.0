Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A529FB42A6
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 23:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388894AbfIPVHA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 17:07:00 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44212 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730662AbfIPVHA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 17:07:00 -0400
Received: by mail-pg1-f194.google.com with SMTP id i18so667196pgl.11
        for <linux-next@vger.kernel.org>; Mon, 16 Sep 2019 14:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iS/KS7K2dpElo8VkeXq0MZCaa3SuE0K1o3j4psLcFA8=;
        b=YdLjxYgRbkoi06bMhkQnbta7mRwdXc5iGkj16WLjvWHccLbl1IEoEQgQNK9cuSyldW
         mnG6FyS+PTWXYUivgSnH4ar0Jz0Bnce/CsdKs9TZhWuClo9vkix9oeoonQEOa2uZcDCc
         VwBR4oL1DF5bCfjUsZKsnNxhGxKXrY7zSIA14puGVdFeaO39XPeEtBC3r3MkEXp1dcHv
         2ZyUHyoSYB1Z0yuR0gki0YDurp2BTja5VXeKRKLBTAHnqJrgbpYkAJnnt+kaFhh5rh0U
         r9NF7VHvDToPuWN663YyucmZrI2bEzZAW+9yvVVYSiCbrFJjmCcxYnGDaBUB/bip6C+m
         EiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iS/KS7K2dpElo8VkeXq0MZCaa3SuE0K1o3j4psLcFA8=;
        b=X1fI1svoDCHijMLEoWVguuLZsmdpEPfvIArJnm9sJZ8Lh/5B1dB7olv0mRpEuE9dez
         PcRTAU7u7kWApJgJWpacHbtKtUY4Yrg8qk8xLBbq376CcDpWKBY3cvxyQdoRdQS1Oxql
         yF9BzdHXpb3GBPqJ4HACAP+M1naOYnLMnYmx1N5AQl+lb0dbI9f9cp6Hp3yb8Wg5yRMu
         u3QL47PfEyxJbmVXLhTYHD00veJg5Dy71CnsB5NniN4Q350/WFfgoM3x6GTeNsGSbsAr
         65AjNUtyHnpvXjcnH1ZPnPoBehD/XTdQhuRfCe8tRLC2U+lc4s1wclURz16NwyfE/E4b
         QmVA==
X-Gm-Message-State: APjAAAXL1YY8PdKay8R7HiCXPgap1x3AzVF9n7xjJOssVN8pKBl0uEtM
        Ty/51wjptnYBH0gARm+Tq/G2Vq29QXDtz5xYZrhdzA==
X-Google-Smtp-Source: APXvYqxZco9RmXoG2vVXf/2rxlM8ja+bWzzGh23VEs5YPWBvIGKwLERa7drgEvqHT1ZmjmG63H9hom+fnxJ5QfbcVic=
X-Received: by 2002:a62:5fc1:: with SMTP id t184mr414733pfb.84.1568668017409;
 Mon, 16 Sep 2019 14:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190915214748.GJ4352@sirena.co.uk>
In-Reply-To: <20190915214748.GJ4352@sirena.co.uk>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 16 Sep 2019 14:06:46 -0700
Message-ID: <CAKwvOdkZ9_qp9V=H6tjpLyscct+g-aPqn-dPj8R+CGF4Rt_-Rw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the kbuild tree
To:     Mark Brown <broonie@kernel.org>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Roman Li <Roman.Li@amd.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Jun Lei <Jun.Lei@amd.com>,
        Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xinpeng Liu <danielliu861@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Sep 15, 2019 at 2:47 PM Mark Brown <broonie@kernel.org> wrote:
>
> Hi all,
>
> Today's linux-next merge of the drm tree got a conflict in:
>
>   drivers/gpu/drm/amd/display/dc/dml/Makefile
>
> between commit:
>
>   54b8ae66ae1a345 ("kbuild: change *FLAGS_<basetarget>.o to take the path relative to $(obj)")
>
> from the kbuild tree and commits:
>
>   0f0727d971f6fdf ("drm/amd/display: readd -msse2 to prevent Clang from emitting libcalls to undefined SW FP routines")

^ this patch is now broken due to the SHA above it.

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
index 2b399cfa72e6..ddb8d5649e79 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
@@ -19,7 +19,7 @@ endif
 CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o := -mhard-float -msse
$(cc_stack_align)

 ifdef CONFIG_CC_IS_CLANG
-CFLAGS_dcn20_resource.o += -msse2
+CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o += -msse2
 endif

 AMD_DAL_DCN20 = $(addprefix $(AMDDALPATH)/dc/dcn20/,$(DCN20))


>   542816ff168d8a3 ("drm/amd/display: Add DCN2.1 changes to DML")
>   b04641a3f4c54b0 ("drm/amd/display: Add Renoir DML")
>   057fc695e934a77 ("drm/amd/display: support "dummy pstate"")
>
> from the drm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 83792e2c0f0e4,af2a864a6da05..0000000000000
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@@ -32,16 -32,29 +32,25 @@@ endi
>
>   dml_ccflags := -mhard-float -msse $(cc_stack_align)
>
> + ifdef CONFIG_CC_IS_CLANG
> + dml_ccflags += -msse2
> + endif
> +
>  -CFLAGS_display_mode_lib.o := $(dml_ccflags)
>  +CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
>
>   ifdef CONFIG_DRM_AMD_DC_DCN2_0
>  -CFLAGS_display_mode_vba.o := $(dml_ccflags)
>  -CFLAGS_display_mode_vba_20.o := $(dml_ccflags)
>  -CFLAGS_display_rq_dlg_calc_20.o := $(dml_ccflags)
>  -CFLAGS_display_mode_vba_20v2.o := $(dml_ccflags)
>  -CFLAGS_display_rq_dlg_calc_20v2.o := $(dml_ccflags)
>  -endif
>  +CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_ccflags)
>  +CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20.o := $(dml_ccflags)
>  +CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20.o := $(dml_ccflags)
> ++CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_mode_vba_20v2.o := $(dml_ccflags)
> ++CFLAGS_$(AMDDALPATH)/dc/dml/dcn20/display_rq_dlg_calc_20v2.o := $(dml_ccflags)
> + ifdef CONFIG_DRM_AMD_DC_DCN2_1
>  -CFLAGS_display_mode_vba_21.o := $(dml_ccflags)
>  -CFLAGS_display_rq_dlg_calc_21.o := $(dml_ccflags)
>  -endif

^ this endif should not be removed.


>  -ifdef CONFIG_DRM_AMD_DCN3AG
>  -CFLAGS_display_mode_vba_3ag.o := $(dml_ccflags)
> ++CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_mode_vba_21.o := $(dml_ccflags)
> ++CFLAGS_$(AMDDALPATH)/dc/dml/dcn21/display_rq_dlg_calc_21.o := $(dml_ccflags)
>   endif
>  -CFLAGS_dml1_display_rq_dlg_calc.o := $(dml_ccflags)
>  -CFLAGS_display_rq_dlg_helpers.o := $(dml_ccflags)
>  -CFLAGS_dml_common_defs.o := $(dml_ccflags)
>  +CFLAGS_$(AMDDALPATH)/dc/dml/dml1_display_rq_dlg_calc.o := $(dml_ccflags)
>  +CFLAGS_$(AMDDALPATH)/dc/dml/display_rq_dlg_helpers.o := $(dml_ccflags)
>  +CFLAGS_$(AMDDALPATH)/dc/dml/dml_common_defs.o := $(dml_ccflags)
>
>   DML = display_mode_lib.o display_rq_dlg_helpers.o dml1_display_rq_dlg_calc.o \
>         dml_common_defs.o



--
Thanks,
~Nick Desaulniers
