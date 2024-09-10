Return-Path: <linux-next+bounces-3725-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06372972B4B
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 09:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58DC4B22A50
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 07:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6EC181328;
	Tue, 10 Sep 2024 07:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="FSlbH3qX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FC417D374
	for <linux-next@vger.kernel.org>; Tue, 10 Sep 2024 07:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725954990; cv=none; b=DUmJ0yy3/JwRDOPCxs/KmzmN4Qgdq0O6jY818uV+eJH0n+Pk36lPWg/NVDPKcSdEHGe+i8dSEPCZ1/y9XdKrEW89waw56IfG0S6A0cHvwUhNNEjU8ZQTZE2tn8g9vOGl+c/sc2vpoDNPBWJdpiCEAJdnQNSc9avK9hm0ab+BqCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725954990; c=relaxed/simple;
	bh=VrIUPlUOj5CYAUoSYvq7AKhsAMm5SkEVD2QO5ESmLoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3Hb7bBw3dGTVDugPkw0HFsk1HypGvXeXeUrJ970Y6+VJM/xeTUJTUp48hNtI/cXsIfqfmU9HHp3JwtWgXlU3kxvEJFZUnghgcOelxLTlZhcsT23MPmO+gt8BT4Olc0+NAqqafEkFxZwvov7NvWQ636zRdXn3jUfC+OmL4Ou3ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=FSlbH3qX; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53661a131b4so3200675e87.1
        for <linux-next@vger.kernel.org>; Tue, 10 Sep 2024 00:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1725954986; x=1726559786; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=//cKbjnKgSrThkwY/F5WDPrL9+PxxWmg/398CCvU/Is=;
        b=FSlbH3qXjWIUpw62vUH5rMpYjROB3bZp2cukJfzWBxIBRs7+vrI+QQ0+2e8ZgR1+IL
         2vBBHC6JDj497HnzAO4Cgga5C6yjjZwFEyKA8jY2rOL63uhDU0zk+VpW4/7OeIbwyDd3
         aI7+dKm3qrKL8G8quV/WnEe9X/Scg+5C/jO9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725954986; x=1726559786;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//cKbjnKgSrThkwY/F5WDPrL9+PxxWmg/398CCvU/Is=;
        b=IRxGjE3O1Y7D35hv6Zn7rWJkbI83O6o/VebhIzgjZZlPbgEM4RXYC6hgOz+ZXMAq5d
         qSXBpcE7VAWyi/4LKfUL8W6BP2+b4JgKllq0v6pyHs/PcPYJPLaXtwOyjqEtRtXdnTlf
         JLnXH2aug6to7PZA49HB/eQ4sdSjnohwhSYg4sFEdZJrBwhsWxqaoXi/lt4/wEjkJbAf
         nZGAzlq8d+SFUOLkVIBx0Ils60llSV17qjGy3uUUP5sZaMP2UlIrYd3yA2A9ADrT+CtD
         rDlO6oXfv116w3Ce0CxijTFO0KRVItSYUEgab76115UQxQ1/8LI01FJ55kr9aAXYch1f
         YEgw==
X-Gm-Message-State: AOJu0YxgPrV0VAeEcjJw/GyI2kw4SAM/NPJ9rI+tBfMBb2ceDVj13LhQ
	9AWKU1Of0jLokrYqlNLY6dFjxcnHvTkT8z7I6hVzibWk2KUP0PNpXwtu57RS97RI65CfNsME3cd
	WWLaWSDsY/2ihxUezzXBBKjRoP3rC1vExsQASSw==
X-Google-Smtp-Source: AGHT+IG4Wb2YSI78onb6YR3O1bcsqebY13v+unbEaoALljHyDpp77DQVal4bFZf888t1a1bfY1IGAr8hYBb5QxlKeuE=
X-Received: by 2002:a05:6512:234e:b0:52e:9d6b:2691 with SMTP id
 2adb3069b0e04-536587b07ebmr9509034e87.20.1725954985566; Tue, 10 Sep 2024
 00:56:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87v7z586py.fsf@debian-BULLSEYE-live-builder-AMD64>
 <20240909-einjagen-meterhoch-45c77ca03164@brauner> <CAJqdLrq+pScjJdnrp2jAZMqKEq-SyEjsBdb-=9QAFN6=h1=S5w@mail.gmail.com>
 <20240909-unwillig-irreal-26bd9fa085c6@brauner> <CAJqdLrqjD_vXVm48LG-9HM_wRsSFUg46rrWFL+o24n6dLgQJ6g@mail.gmail.com>
 <20240909-arterien-zweit-3502f11b9f50@brauner> <CAJqdLrpA4B3rKOWcwYyBA14ofPiSba2qrAggYBE2D_h70zni2A@mail.gmail.com>
 <20240909-zumal-revision-8af9dc0593e5@brauner> <CAJqdLrrz-DH0YLbMFt951c4jiZMAiCVcS0YR3Mz-y=O3zNn6Kg@mail.gmail.com>
 <CAJqdLrpwuaPG3PoFwbxPRp8GrbEWooXazrMZgV4Wj=FK=vq=6A@mail.gmail.com> <877cbkaque.fsf@debian-BULLSEYE-live-builder-AMD64>
In-Reply-To: <877cbkaque.fsf@debian-BULLSEYE-live-builder-AMD64>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Tue, 10 Sep 2024 09:56:13 +0200
Message-ID: <CAJqdLrqqyrA9JmBijFiwwhCaw_FEHj6W8j_n0mr5rGWJDk2TpQ@mail.gmail.com>
Subject: Re: [BUG REPORT] linux-next/fs-next released on 6th September fails
 to boot
To: Chandan Babu R <chandanbabu@kernel.org>, Miklos Szeredi <mszeredi@redhat.com>
Cc: linux-next@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Am Di., 10. Sept. 2024 um 09:51 Uhr schrieb Chandan Babu R
<chandanbabu@kernel.org>:
>
> On Mon, Sep 09, 2024 at 05:56:11 PM +0200, Alexander Mikhalitsyn wrote:
> > Dear Chandan,
> >
> > Please can you check if the following patch resolves issue for your workload:
> >
> > diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> > index 7885f071fa1e..f130b23d6850 100644
> > --- a/fs/fuse/dev.c
> > +++ b/fs/fuse/dev.c
> > @@ -148,7 +148,7 @@ static struct fuse_req *fuse_get_req(struct
> > mnt_idmap *idmap,
> >         if (for_background)
> >                 __set_bit(FR_BACKGROUND, &req->flags);
> >
> > -       if ((fm->sb->s_iflags & SB_I_NOIDMAP) || idmap) {
> > +       if (!fm->sb || (fm->sb->s_iflags & SB_I_NOIDMAP) || idmap) {
> >                 kuid_t idmapped_fsuid;
> >                 kgid_t idmapped_fsgid;
> >
> > From your call stack if looks caused by CUSE case.
> > It's my bad that I have not considered this use case for
> > fuse_get_req() and there is, obviously,
> > no such thing as fm->sb for CUSE scenario.
> >
>
> The above patch solves the problem. Thank you!

Awesome! Thanks, Chandan!

I'll send a patch to LKML a bit later once Miklos take
https://lore.kernel.org/linux-fsdevel/20240906143453.179506-1-aleksandr.mikhalitsyn@canonical.com
series.

Kind regards,
Alex

>
> --
> Chandan

