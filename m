Return-Path: <linux-next+bounces-3893-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9391F97B497
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 22:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 207891F2397A
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 20:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB215187FF5;
	Tue, 17 Sep 2024 20:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaL7SDCx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477A313777E;
	Tue, 17 Sep 2024 20:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726604700; cv=none; b=eYYSEimfvxAReOoxf8M5z0zXKrf2ekyLRNaV3gENe+rjK3ziZTOfU8rA2+Q7uEhVVi6IF3AyXgPuse9X14h2tV8R8ZUwdTaPN5MrUjgtzIo/wPsX0GER0FUEuJUxmPRy70zz2RKcfyBdtwxk7EEoxvFRLxQsabLljEB0s0VZydo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726604700; c=relaxed/simple;
	bh=IAVkXOQbqNQ+A/paHcRK+K11s9PaWvOcPjw8qgl15js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H9ijTN4YwlLDBqD2mfyCSncoyHYQr6F++VgXhLdSlXZdYyJcMVl88OEEc0tnxkovqN7KswBnNxXR3rR1Rw5VEPsS6lv6OfBSy/cwfXdeteMCP2E2jIx2eFhTCm2iqnXCnt1z36TXyXnVgy9Bsby3AyXZunOMvngBhwwLinYV+Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaL7SDCx; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2d87a57c06fso940513a91.2;
        Tue, 17 Sep 2024 13:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726604698; x=1727209498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Id4GKCIpjHK3vGXpxt6PC/t1QKXrcVdOg0xAcAolYI=;
        b=DaL7SDCxemPPtlecDo+Qr8VutvtnZGi6zN1YnbumO7oxvAqZRO9K7LdSNMenfj1puY
         cwQQsDvPO2cr7GPnocJyHDG8S+0W+6SgE+X4wK5fVGbxtZSlnQxMIlKt1maYVvIISTB9
         FUVyCFsc4HGn3XCKu6huArC6c+XPCbADV4w50lAIpThiMDZxTGsuBdrFGtcdLa21rOb5
         mRyZZID1fs8qkoWXHQkGUhH2uy+aUKH/p37WTk7sXoA0l4AS2P8zgncmrfGlMdPIcmov
         iLTUyuA9CQG88crdfccaiDRPR8NSTfvW/PbXAnE08dlxoJA//nwKhc1STWBT7j7N76pQ
         2jwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726604698; x=1727209498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Id4GKCIpjHK3vGXpxt6PC/t1QKXrcVdOg0xAcAolYI=;
        b=Yqmqo2V8ENLSgkCYLDor0fmoHLTD6eJmP0IRsVM7QO2scz6h2HhXnwATVx0jzddBnd
         U5fB1vfMOFGbHv8ComZQ5Y8eODBQzMoa3Keqh1SiMy2GKOp+JjBrOzGUo1c0AgsMOMLt
         Gt3FWpKUJtO+5eZ2CIM+w4eTpIfCiyNg6eJw//Xu+G1MxrDrlhbOs7apir+Y7a5LA99w
         AZZFLM94QwM/RrmchnvDLB7CzS81aFyd3DYJToINGN54tWSrS6mw879LdBJk/PRUxEUM
         AP38S62+iQEoLCX4YhilQpC9EdGLvY8DTpiYyrrDGfbJC3p9M8MxnCPu2kq2kVMttrpI
         Og1g==
X-Forwarded-Encrypted: i=1; AJvYcCVuVy5HsAcDCNtqzKIALLWgNChXaAMyVnLfqzXmenHESVO4IBy5Q6t4+6sgJsAnzvwOQeR8JOSGC7dc7Q==@vger.kernel.org, AJvYcCXOoLD8a1ybjOPBgfvF39u0qqTHhrP35O7So7AwiUZiEuuJyrePOMYezZODFrScmb1STe4PmPm1dfaCb34=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOSd3xJpE2mQDCv0UAt8I90+2afdVvapAWa6RJP8Qy4sZ72LJ4
	oMEn7/y7XW254qqxN8O3jC5pl0j//l7VXq+I+ms9yJkY5uCKEV2IihAPgBsvZfH/Nvggu0c9rmE
	TF31JUm1l9p7LHGc2WyVooZgS5ck=
X-Google-Smtp-Source: AGHT+IFCDRUphcZwCSNQ9l93mPk9heYwuLJ5usPzFHJu9Rp4nIPipiFcuyVqWnOWRaFZDJ9/oYI1YejF8NLj/dKwG7s=
X-Received: by 2002:a17:902:cec6:b0:206:b8b7:883 with SMTP id
 d9443c01a7336-2076e375379mr119298905ad.1.1726604698482; Tue, 17 Sep 2024
 13:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240916141517.3ef8b349@canb.auug.org.au> <4d69172b-dd12-433c-a030-3d48f2716e0a@math.uni-bielefeld.de>
In-Reply-To: <4d69172b-dd12-433c-a030-3d48f2716e0a@math.uni-bielefeld.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Sep 2024 16:24:46 -0400
Message-ID: <CADnq5_Mx1b16sbJH2Y_XfD9GiYvuGtwZyxRa_1u151aZbZEyHA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, 
	"Wentland, Harry" <Harry.Wentland@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@redhat.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Jerry Zuo <jerry.zuo@amd.com>, 
	DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Mario Limonciello <mario.limonciello@amd.com>, 
	Sung Joon Kim <sungjoon.kim@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Harry

On Mon, Sep 16, 2024 at 8:58=E2=80=AFAM Tobias Jakobi
<tjakobi@math.uni-bielefeld.de> wrote:
>
> On 9/16/24 06:15, Stephen Rothwell wrote:
>
> > Hi all,
> >
> > Today's linux-next merge of the drm tree got a conflict in:
> >
> >    drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
> >
> > between commit:
> >
> >    e835d5144f5e ("drm/amd/display: Avoid race between dcn35_set_drr() a=
nd dc_state_destruct()")
> >
> > from Linus' tree and commit:
> >
> >    be7a6a517164 ("drm/amd/display: Check stream pointer is initialized =
before accessing")
> >
> > from the drm tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tre=
e
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularl=
y
> > complex conflicts.
> >
> On close inspection it might be worthwhile to take the same precautions
> that we now take with tg, also with pipe_ctx[i]->stream.
>
> @Alex: What do you think?

@Wentland, Harry can stream be NULL here?

Alex

>
> With best wishes,
> Tobias
>

