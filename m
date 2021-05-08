Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 188F6376F8A
	for <lists+linux-next@lfdr.de>; Sat,  8 May 2021 06:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbhEHE31 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 8 May 2021 00:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhEHE31 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 8 May 2021 00:29:27 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91DECC061574
        for <linux-next@vger.kernel.org>; Fri,  7 May 2021 21:28:25 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id gx21-20020a17090b1255b02901589d39576eso127307pjb.0
        for <linux-next@vger.kernel.org>; Fri, 07 May 2021 21:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lT+Hlg4ADm1P1P0CFbZk9N2b8mFk7+dIjhu7jpeItgI=;
        b=WwVcj3+2b/E7VuO1+uvwPwiwtxD4mwvEuIz7iicDA4tHqvrpFrjMOBxfPnXT/OF3WR
         oydpGT3MZyypF0tvhycks6EWNYPswhm1XEEYjeZXBjAHJS7lS6//+2WOA3EeYKQS6K4I
         nYMSIKvrazqW8Bfqgej/ktWUdKIB00JSa6Pwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lT+Hlg4ADm1P1P0CFbZk9N2b8mFk7+dIjhu7jpeItgI=;
        b=ikngjZspipaW+xrFE3cdYjvGtUDRE730xRY6DANh/S72pyBw6sRl+K3yNzIoNbZkUn
         ncLgCH3LBYQnOcBeUkM0/f0wh7+y+IiAni/zWMYmCSHp4TsB0787pHexHXRwlfNtAIyh
         CaxoOlfzZxcP6xgSgN+s/E5a5NMgPvL+4XH1bCE29G96XEIAGzgBUkaOJrGB32zpge5L
         meoT9UJJezWmCh6llwkXgVxJtgUaG385L/hbLJQ+KNnVGfEVtcz3qNeWONSyqdraVZtt
         5+Zv/W0OAJiX2cjE/Kx1HSh1/BMovDWkyxcIgLQaFtShm6amo3XwSw1abwL2uukq+dC8
         Cl4g==
X-Gm-Message-State: AOAM532lVgqmppC0MR8tf2y6P5omjGnKwxrEBM/x6v3mS7jm0m6+nqti
        jd1jn2C837ZjIuAUc6pkAIfVbQ==
X-Google-Smtp-Source: ABdhPJxyQVL83KGaDZqCisHbJ1gqhZrZZS3+s8RCn5yUCegW5vh9XJTqAJ98B2I27DWQzDHljRYvtw==
X-Received: by 2002:a17:90a:730c:: with SMTP id m12mr26973561pjk.111.1620448105199;
        Fri, 07 May 2021 21:28:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d188sm5851024pfd.203.2021.05.07.21.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 21:28:24 -0700 (PDT)
Date:   Fri, 7 May 2021 21:28:23 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jiawei Gu <Jiawei.Gu@amd.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc:     "StDenis, Tom" <Tom.StDenis@amd.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        "Gu, JiaWei (Will)" <JiaWei.Gu@amd.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "Nieto, David M" <David.Nieto@amd.com>, linux-next@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface
Message-ID: <202105072117.1480D10A@keescook>
References: <20210422023448.24689-1-Jiawei.Gu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422023448.24689-1-Jiawei.Gu@amd.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi!

This patch needs some fixing.

On Thu, Apr 22, 2021 at 10:34:48AM +0800, Jiawei Gu wrote:
> +		case AMDGPU_INFO_VBIOS_INFO: {
> +			struct drm_amdgpu_info_vbios vbios_info = {};
> +			struct atom_context *atom_context;
> +
> +			atom_context = adev->mode_info.atom_context;
> +			memcpy(vbios_info.name, atom_context->name, sizeof(atom_context->name));
> +			vbios_info.dbdf = PCI_DEVID(adev->pdev->bus->number, adev->pdev->devfn);
> +			memcpy(vbios_info.vbios_pn, atom_context->vbios_pn, sizeof(atom_context->vbios_pn));
> +			vbios_info.version = atom_context->version;
> +			memcpy(vbios_info.date, atom_context->date, sizeof(atom_context->date));
> +			memcpy(vbios_info.serial, adev->serial, sizeof(adev->serial));

This writes beyond the end of vbios_info.serial.

> +			vbios_info.dev_id = adev->pdev->device;
> +			vbios_info.rev_id = adev->pdev->revision;
> +			vbios_info.sub_dev_id = atom_context->sub_dev_id;
> +			vbios_info.sub_ved_id = atom_context->sub_ved_id;

Though it gets "repaired" by these writes.

> +
> +			return copy_to_user(out, &vbios_info,
> +						min((size_t)size, sizeof(vbios_info))) ? -EFAULT : 0;
> +		}

sizeof(adev->serial) != sizeof(vbios_info.serial)

adev is struct amdgpu_device:

struct amdgpu_device {
...
        char                            serial[20];


> +struct drm_amdgpu_info_vbios {
> [...]
> +	__u8 serial[16];
> +	__u32 dev_id;
> +	__u32 rev_id;
> +	__u32 sub_dev_id;
> +	__u32 sub_ved_id;
> +};

Is there a truncation issue (20 vs 16) and is this intended to be a
NUL-terminated string?

-- 
Kees Cook
