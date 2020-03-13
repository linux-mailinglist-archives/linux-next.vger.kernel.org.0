Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A59E9184935
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 15:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgCMOXA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 10:23:00 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:56220 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgCMOXA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2020 10:23:00 -0400
Received: by mail-wm1-f65.google.com with SMTP id 6so10158395wmi.5;
        Fri, 13 Mar 2020 07:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lS49J6xe9O18O9rcu2kU0PUQpZVP23hwbK2ESpDCzbU=;
        b=fMzpDmJUGYOajQP7Y97dYff/Au+aJtOrAeG8WU7UFIlVMCKlTnC0DbQeXMrJfahHFb
         2X87Z1IvFmRAUr8fjUsX9m+j0zZlSRLwai3MepZaOIrb+EOIaIqNPR5rNiwYWxzRmV9K
         7dlAsiiodnKbAKwy0JG8WbU4BYz5+OvAwDDyL5asezMxfdZ9ieeaOuoOF5ySmH3TZvL0
         ihOeE/lLWBIgZvYKijIV/CSzFV99wwGktDZs8qZcRc/In3yZVbaUqYNbJlqJ5zAifhuc
         Q/ukYBLRb7V8UERJ3wDQnhk19IZQ1jxum2BuXWzhjUK1EsIwZbj0QALr/WE2xUM8Kaqc
         CNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lS49J6xe9O18O9rcu2kU0PUQpZVP23hwbK2ESpDCzbU=;
        b=bhjKPArog57mYFDlxR2JO6vnIh7IaJgTmmB2umfyVldYQhc7jSpP3MFyz1Mn99aH1U
         6fEftdgMPLnQPX3Are71n4GAohn6Uxm8aI87Ovgu3w3er0AqoWF4B5ncDXr/oeYi4HJ+
         ZPBOTPMIyw9Uji2/PV9ir3AMI2mRHEDrBfgDYxXbctZ7XDncIePsZWvuNarvPIV/Y4id
         q6O5D9ACxREahIM2RLObTXAXEYPBEAVwA/nRciwOYNUbBr3W8vB8JUqYcMPXGK+m9HgQ
         E5NiSWepx/KcVUq5PFDjoQ/eD8SiPKQAXp9GSY7twFjt0H4IPAMMN6e2FXPPfGGKl7JH
         tUxw==
X-Gm-Message-State: ANhLgQ2LFzQ9IeMNRWMB2vOJfgs/ehZVdzU5xsRDE/zcNX5Sukx35100
        QKRbKoRnsdsI29vXKaAHi/ruVlkw/pJuDEdlWlznDA==
X-Google-Smtp-Source: ADFU+vtK1crtde2+NFsIU5I6g4Z2V2bkR2JqJNr61b5NbN18ks983WaQ0Ne/oquXFz+WVEBk12Mk0geKDCJpolW97Bo=
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr11119920wmc.39.1584109376765;
 Fri, 13 Mar 2020 07:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200313205748.03d30145@canb.auug.org.au> <d67ed65313f3a1579c1cf88348e8853c5cca4598.camel@perches.com>
In-Reply-To: <d67ed65313f3a1579c1cf88348e8853c5cca4598.camel@perches.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 13 Mar 2020 10:22:45 -0400
Message-ID: <CADnq5_MEFu+6Hgp4jZQJpskHbZmK=UiKtSJrdB92_NYZyyjtAg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: Move fallthrough; into containing #ifdef/#endif
To:     Joe Perches <joe@perches.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Mar 13, 2020 at 8:59 AM Joe Perches <joe@perches.com> wrote:
>
> The automated conversion of /* fallthrough */ comments converted
> a comment outside of an #ifdef/#endif case block that should be
> inside the block.
>
> Move the fallthrough inside the block to silence the warning.
>
> Signed-off-by: Joe Perches <joe@perches.com>

Applied.  Thanks!

Alex

> ---
>
> On Fri, 2020-03-13 at 20:57 +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the amdgpu tree, today's linux-next build (powerpc
> > allyesconfig) produced this warning:
> >
> > In file included from include/linux/compiler_types.h:59,
> >                  from <command-line>:
> > drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/smu7_hwmgr.c: In function 'smu7_request_link_speed_change_before_state_change':
> > include/linux/compiler_attributes.h:200:41: warning: statement will never be executed [-Wswitch-unreachable]
> >   200 | # define fallthrough                    __attribute__((__fallthrough__))
> >       |                                         ^~~~~~~~~~~~~
> > drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/smu7_hwmgr.c:3706:4: note: in expansion of macro 'fallthrough'
> >  3706 |    fallthrough;
> >       |    ^~~~~~~~~~~
> >
> > Introduced by commit
> >
> >   e86efa063cd1 ("AMD POWERPLAY: Use fallthrough;")
>
> This is also one of the #ifdef/#endif pairs
> where the fallthrough is outside of the #endif.
>
> https://lore.kernel.org/lkml/cover.1584040050.git.joe@perches.com/
>
> Here is a delta patch for this.
> Let me know if another form is needed.
>
>  drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> index fc5236c..774048 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> @@ -3702,8 +3702,8 @@ static int smu7_request_link_speed_change_before_state_change(
>                 case PP_PCIEGen2:
>                         if (0 == amdgpu_acpi_pcie_performance_request(hwmgr->adev, PCIE_PERF_REQ_GEN2, false))
>                                 break;
> -#endif
>                         fallthrough;
> +#endif
>                 default:
>                         data->force_pcie_gen = smu7_get_current_pcie_speed(hwmgr);
>                         break;
> --
> 2.24.0
>
>
