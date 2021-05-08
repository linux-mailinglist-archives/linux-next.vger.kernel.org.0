Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B53BB377115
	for <lists+linux-next@lfdr.de>; Sat,  8 May 2021 11:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbhEHJwf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 8 May 2021 05:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbhEHJwe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 8 May 2021 05:52:34 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8F2AC061574
        for <linux-next@vger.kernel.org>; Sat,  8 May 2021 02:51:32 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id x188so9634066pfd.7
        for <linux-next@vger.kernel.org>; Sat, 08 May 2021 02:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GFwGuOaySNCKOb5aolQrcMuXg5+nQanjXXgSykQio2M=;
        b=M4pJeFQAlIldUETVkcdClbGw6UnZnwDR77kI9X21y8AMLszLsMhQPYigxJSjqr1Lco
         CMDNIFuR4J8rCkFDfxb76NnJF3t3PGCoRiLzgqtnq4iY+nE6IZbIti2by53KfjO36o4+
         gRuqxs6AqTI5pV4FoCpSHnoakHMrKLRMbgOCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GFwGuOaySNCKOb5aolQrcMuXg5+nQanjXXgSykQio2M=;
        b=X+h0D9aO+5ldk7wa3Xpzfgqg9r21oZbsiqu5VRSOd/Z4ygc7sdeDV9F3vAyzixVdsK
         B55TJqvh3JdG52zxZqw8IBqIj7zjHs2ubzIBFyOuTrDjaAORuY7Mxu1k3uPvpc+LZO5n
         XwP6shmIS5+2eiD5++Ot+hn1cZZqMeJAkKQjroieatlfzs8QgHH6djwH8WMeO7+pPmGE
         Zu9Kh/YAZtfQCB/fZWt6jQf+CBKGXB0K2O+xcHhbk+0NcUK2SQssrOjUbmOOEFIoix7w
         GlJtgOvO1/CecbK5v+f/KApba/+DRR3XobMzh5jWtxDH1Y9J/erU1D+ymbpPjATxUDcc
         I1rQ==
X-Gm-Message-State: AOAM532lVCrdGtZwZpqrOcm2XvSMGu/QneDSeoGMHmr+b8eswN8sPe1w
        9q/mptYz1AvtDsxXyR4LlK1P8Q==
X-Google-Smtp-Source: ABdhPJyB806feKtO6oygcd6agrBe0ep3z7tJZr2CYBpILWFsWqZJxWPGPuyoArkxat5PdkB6zXpcxA==
X-Received: by 2002:a65:5088:: with SMTP id r8mr14243199pgp.12.1620467492290;
        Sat, 08 May 2021 02:51:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d16sm6778057pgk.34.2021.05.08.02.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 02:51:31 -0700 (PDT)
Date:   Sat, 8 May 2021 02:51:30 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gu, JiaWei (Will)" <JiaWei.Gu@amd.com>
Cc:     "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "StDenis, Tom" <Tom.StDenis@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "Nieto, David M" <David.Nieto@amd.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface
Message-ID: <202105080251.65694F9F@keescook>
References: <20210422023448.24689-1-Jiawei.Gu@amd.com>
 <202105072117.1480D10A@keescook>
 <BN9PR12MB51616B5E43086FC4CE2B58FFF8569@BN9PR12MB5161.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BN9PR12MB51616B5E43086FC4CE2B58FFF8569@BN9PR12MB5161.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, May 08, 2021 at 06:01:23AM +0000, Gu, JiaWei (Will) wrote:
> [AMD Official Use Only - Internal Distribution Only]
> 
> Thanks for this catching Kees.
> 
> Yes it should be 20, not 16. I was not aware that serial size had been changed from 16 to 20 in struct amdgpu_device.
> Will submit a fix soon.

You might want to add a BUILD_BUG_ON() to keep those in sync, especially
since it's about to be UAPI.

-Kees

> 
> Best regards,
> Jiawei
> 
> 
> -----Original Message-----
> From: Kees Cook <keescook@chromium.org> 
> Sent: Saturday, May 8, 2021 12:28 PM
> To: Gu, JiaWei (Will) <JiaWei.Gu@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>
> Cc: StDenis, Tom <Tom.StDenis@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Christian König <ckoenig.leichtzumerken@gmail.com>; Gu, JiaWei (Will) <JiaWei.Gu@amd.com>; amd-gfx@lists.freedesktop.org; Nieto, David M <David.Nieto@amd.com>; linux-next@vger.kernel.org
> Subject: Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface
> 
> Hi!
> 
> This patch needs some fixing.
> 
> On Thu, Apr 22, 2021 at 10:34:48AM +0800, Jiawei Gu wrote:
> > +		case AMDGPU_INFO_VBIOS_INFO: {
> > +			struct drm_amdgpu_info_vbios vbios_info = {};
> > +			struct atom_context *atom_context;
> > +
> > +			atom_context = adev->mode_info.atom_context;
> > +			memcpy(vbios_info.name, atom_context->name, sizeof(atom_context->name));
> > +			vbios_info.dbdf = PCI_DEVID(adev->pdev->bus->number, adev->pdev->devfn);
> > +			memcpy(vbios_info.vbios_pn, atom_context->vbios_pn, sizeof(atom_context->vbios_pn));
> > +			vbios_info.version = atom_context->version;
> > +			memcpy(vbios_info.date, atom_context->date, sizeof(atom_context->date));
> > +			memcpy(vbios_info.serial, adev->serial, sizeof(adev->serial));
> 
> This writes beyond the end of vbios_info.serial.
> 
> > +			vbios_info.dev_id = adev->pdev->device;
> > +			vbios_info.rev_id = adev->pdev->revision;
> > +			vbios_info.sub_dev_id = atom_context->sub_dev_id;
> > +			vbios_info.sub_ved_id = atom_context->sub_ved_id;
> 
> Though it gets "repaired" by these writes.
> 
> > +
> > +			return copy_to_user(out, &vbios_info,
> > +						min((size_t)size, sizeof(vbios_info))) ? -EFAULT : 0;
> > +		}
> 
> sizeof(adev->serial) != sizeof(vbios_info.serial)
> 
> adev is struct amdgpu_device:
> 
> struct amdgpu_device {
> ...
>         char                            serial[20];
> 
> 
> > +struct drm_amdgpu_info_vbios {
> > [...]
> > +	__u8 serial[16];
> > +	__u32 dev_id;
> > +	__u32 rev_id;
> > +	__u32 sub_dev_id;
> > +	__u32 sub_ved_id;
> > +};
> 
> Is there a truncation issue (20 vs 16) and is this intended to be a NUL-terminated string?
> 
> --
> Kees Cook

-- 
Kees Cook
