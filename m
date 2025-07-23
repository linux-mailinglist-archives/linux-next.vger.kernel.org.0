Return-Path: <linux-next+bounces-7704-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5E8B0F288
	for <lists+linux-next@lfdr.de>; Wed, 23 Jul 2025 14:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 577841C83D18
	for <lists+linux-next@lfdr.de>; Wed, 23 Jul 2025 12:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E246C2E613B;
	Wed, 23 Jul 2025 12:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ee98WH8P"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7D428B7EA;
	Wed, 23 Jul 2025 12:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753274997; cv=none; b=s3f+1Doy+uBHYAjPADF4Fthi4vniD82FLYKSR68BjzfhvQFIlYI40J2PFFx73qkdJDSdGpSYFV+SSJ7slZHzpt0W6I81mrEG/3g7vV6ogHci6emuP3AKxsQ9M8lWWxzHcgOmRlRMy01bq0OtFvrh+5cEKSY1m+6Q7OSehJ/pszU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753274997; c=relaxed/simple;
	bh=R1ZnDPdr+KLfnXF+L3GBYcBOic3/gGKPyOTI7hCc9Bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pFApsk9UHcIt/gJMp3UnSM1lVEgvJVHFX+FwXc+Ly3ez1hpEsokHmeJyX7TP1OFMBD318Bvck3HDD/af5aIoHoUaTCAaA/OOU0+CEuFmRmc09D/qUPv+NmPZUsnkBIIZ18gCpxBvIb9sD8tMAPM1HKIXNjlOd6sfNeAk6X9xnBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ee98WH8P; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23c71b21f72so10820455ad.2;
        Wed, 23 Jul 2025 05:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753274996; x=1753879796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1ZnDPdr+KLfnXF+L3GBYcBOic3/gGKPyOTI7hCc9Bk=;
        b=Ee98WH8PGqZQrbj6hemgBeCGsZXHcVARPaZBdCfPmioh8jY2t+wfvhmWa41q5W6kAJ
         sf/seB0wroUbBC+U4Pdj5yLIsSxJhE+fwmOd7MwMbfhB6PD/t77KPsQ3mxbu+MF1SLGp
         0Xvsu/cuIFxQSnIt9zNtafVLG4ysBteWxCmHD4tB2cSJS+0Ob8+/NuhvcMVybWm07mtS
         cYW+m+nE1GsoElQfQTl8741tZkySgPnAMoHEI2zNHZ5MbSUI65amC+VsO8bT4SrIJnMQ
         zqgNZtbJmrKhBzm9eyi5SNdgJMRzkSkTg+NwbnJDsw35/nbgANFYZoSfuMW9EXw/S9Yi
         +gmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753274996; x=1753879796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1ZnDPdr+KLfnXF+L3GBYcBOic3/gGKPyOTI7hCc9Bk=;
        b=jZuT2sR5cCIhzG+JNSkNf5d7N60Dwzx6VBOlWMI+F3Kqkr4aqTiCmJKBz83bQFPp+b
         jFeyiRC9P/YV/gTy+djFAaee7GuVhT5FD77zavUWQor1cge5pXV8aO+77Xt0TAU6EzvY
         h+elhURshB2Jx/O7dzaPwyC1cs5bwHfkibPr0LJ9d6Fv+5NZqAsi3P/tnyxNIWNDkHS8
         ed3RtXhFrSEnNx+pV1KeCRKpOILHwMsqc+MPvb1Rk4+sVLaNqahsEq+M1mgQ0F7I1hKR
         tYw5yWk9RgAQ+wKGMdxsrV6MBAPdwztVWhb5gdeUdf65wFl18FEcMgOgZXeBImrbwxPr
         df/A==
X-Forwarded-Encrypted: i=1; AJvYcCXFPVREVtR/+hXiGLQ+sCEHyYxz1huLByWVXRegPuqxZkDQ+kfBUn35YomI6KrdDhyljSbwHmxjjpNq2ik=@vger.kernel.org, AJvYcCXOvPCSVbfg5U8sYgxkzLaYyiBu2RtsbGcW0Os5zyZeQyVuqWYzQsLJSvgn9iXkdOp8z2+HgLgZnJkR3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrlOGdqk3KuTZaaXzTxY4NJiKi4QebF2cb7IZYMWLnQVFwxfp/
	ejsJvSu5w4iRC621JgxK5I17ctrwFlqeFLwQOkPnNOxtljXEV/ZKFudHmaDsaAIf/ackwfv0TYP
	5R5dAnBhdYQbx6urC0GWS5jmc7bcY0HE=
X-Gm-Gg: ASbGnctNH7hgd31J0XpQF/vI/r9zLLu67ZLmrApYA+Aj2+MEriDEXN1lwUBOLN0gxcd
	siCi3RiByycL9ghcsKpYRBcnm9933nNQ353xGfKJvaPmjpwFW/LyexH3hcxe12H+f5KE8vB3Mjm
	7YVyx4u3PD7XEnUG0i/DrGKLwFvshIrliBhQUFJ0uqcTubQ0Hl8FYqX6VqudJklza/dhUIj6ElR
	YnG2EKL
X-Google-Smtp-Source: AGHT+IEPMZZiyO4Rgpj58hEJInZjj5GgFr5IFWeJTNLs8cLo75ujlDwm8/g+buidWOGhCXr/tqd1sz+o4Lvfkq/9e5c=
X-Received: by 2002:a17:902:d48a:b0:234:f1b5:6e9b with SMTP id
 d9443c01a7336-23f98129135mr17643215ad.1.1753274995529; Wed, 23 Jul 2025
 05:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723112605.74f1c077@canb.auug.org.au>
In-Reply-To: <20250723112605.74f1c077@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 23 Jul 2025 14:49:42 +0200
X-Gm-Features: Ac12FXwdy8HYdhV1FZG5TYNUT_XBJ98xcEii8FixuatgzNCqud0xun_O5LCdgb4
Message-ID: <CANiq72m3w8Q74dV5sBTrZDoJom3SLjcOkMeR3LbVOs8+pcsXOQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Shankari Anand <shankari.ak0208@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 3:26=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good to me, thanks!

(I am still checking/testing the others)

Cheers,
Miguel

