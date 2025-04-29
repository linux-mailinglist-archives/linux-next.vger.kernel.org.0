Return-Path: <linux-next+bounces-6445-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 513E3AA3C49
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 01:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8DA8188CADB
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 23:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B2B25F794;
	Tue, 29 Apr 2025 23:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iwb9hoy9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B197513EFF3;
	Tue, 29 Apr 2025 23:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745969483; cv=none; b=W4xN2CJW1UNkTo7+vJPJwxefc/gYVQP6jqeGjEn9KHopJCCehI73k7axJVk8FxCtyGu2PTB+0NfqvmHhEtUaVwVKzRmKs9pC3uBdxrBogXrVVlzjApXf/LSpEaeSQoBIDWwq6x9zynSQXyDD16TIfOJrZ0jPzjWGpE7XhMSOSEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745969483; c=relaxed/simple;
	bh=ws68QzpNPRXm5iYQ1h9ZNWvh8nFaDQz+1EoAmh1h7/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kSG7uz8Ys0b2Djycy5RI3qyx31yaeF6R+IDjiM8kGaXcihXPofYrOKVN+wYScA82vO2vba5tAEQFlk2hrnPPQtIbDUkdOJDxFKF95+my5iXHZkg8YEQBcf/iRQyLT9MyB0aHgyt4L6H1nNkLmHnIzWutoROJfnoJP5JP+k25DgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iwb9hoy9; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30c0517142bso59659811fa.1;
        Tue, 29 Apr 2025 16:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745969480; x=1746574280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7fJoBZtpYgaIvTV/F7OH7KKN0eVTfYC0ZzUcBf7L8g=;
        b=Iwb9hoy9FAq22xvVFb8ao/WIqmEbi72mbIJJEX/Dtn/N03t5FhgedL8pA9Ptxs3J11
         NAt9g6UoipxolhfO0OVAhMH+B4XjEQcd/xI7Z/Mb1bxkD0T4ojRFwcpZgbZBZs8ZCXh4
         Nvbb4DQ+aDZaaptm8Vn2c5lXPgFtFSNHJkTBXFFU6juKZfbqWAKpzhXsBXwQrHdmGnHv
         zVpBigNw5H5uo7E7+cKMDkRF2uZP4obXDaFmMbfPUUA4QtFrsse4J8Mbvpdq1/ujYFmq
         UCpuJ5mrD+uxxLM7GJ74EQpJ6c+mCy4OBtfbCVriIQ3v8QR6rYqPZ4Nao0LlxPeLCLro
         +9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745969480; x=1746574280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7fJoBZtpYgaIvTV/F7OH7KKN0eVTfYC0ZzUcBf7L8g=;
        b=KnJ0WZV9chGL75f365N6cAFTTcNlkrFTa1PCRgo6NYkISfktuJV5HtDdr7Zc6g+b/U
         t6PJYuuecJWGBFDbYZdVaAr9dxIxXYDWDo5M2dUyVZiyOJS7dnXF17hdgbP2Al9hA4kG
         fTErmqh17Nz2seS95QG0pt5CaUxhe60xFy2wZSha6bwtm5RhYM0LMq692ynspoPiD6Z8
         iOi1BBmH81QenAHi5xHOSa0V2hmZWidjMa6EJAbDcb/TECF4lqfWBJs3sGRRX3f/c9xT
         srBEcOyty2YjKf17D0jFP38NyHk+93PY/8qP3Ow28xCenKng8GgubpJlPDZH8P1PFCKm
         AaQg==
X-Forwarded-Encrypted: i=1; AJvYcCVdQM8vcJ4pO+a0MU93qwYQNHbxY952Otz3SHWgyfo2muvrvpI2jpVBGLIraFWrs8D/9xNm6o6cGngeoH8=@vger.kernel.org, AJvYcCXpdhSHIHthjfGlPCMiVZtJaMX8TnxS+gOrzqpgKzDkzvkweKdmW9jTfhB1Q/FXWnSC5BwhMvmH17cAwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygypi3O7GLP0+bIaM880K/FZcjibuDlJNZkSBghqLAkRieIvci
	w3dgrHEAvPLbVhOElqePutOftNVm1gCgW7CHgIMRQgoO9nc74c3l/2yrUQ40CqaIxkdtxtFCe1c
	gd1Qm/Wrxd2b1H4iQCTAetud5jkAQHfaJupM=
X-Gm-Gg: ASbGncs/H+Q14myUWLlzpHTZGKqodxu7yVCLAztux/VeJoof0fS/3o7fxSZnXiReCy2
	lzFoKVEtdAgw6VSewHysYMYawObAVLja9NmCp86l6w3fLJ+gkkLI+LjX3hzvPPb1VdppVDH2RdJ
	XOGQgv1sXqiqnoOkVVs+EEjbtQ09fwRnWq0mSYwg==
X-Google-Smtp-Source: AGHT+IGZbgaQDM+jrVUhnFwMeBSwgcPEn9veOUHjPNsPAmBhZbLljwyfVK8I7b+PE1k0uVKIFtiezDRUe7FgQ2PGLvg=
X-Received: by 2002:a05:651c:516:b0:30b:f775:baf5 with SMTP id
 38308e7fff4ca-31e679063dfmr3306271fa.0.1745969479441; Tue, 29 Apr 2025
 16:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430085544.12800bdd@canb.auug.org.au>
In-Reply-To: <20250430085544.12800bdd@canb.auug.org.au>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 29 Apr 2025 16:30:43 -0700
X-Gm-Features: ATxdqUE_jSUTq76ft0MU4jdlmTlKyDAuL9_Ho4QcMk-fYYVNebDbOcc8v2pLiXc
Message-ID: <CAJ-ks9mQfDwmz=chKjjcjv2KxPk1su4NWfZXey7nNgQWYXzaWA@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the pm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, gldrk <me@rarity.fan>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 3:55=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Commits
>
>   9eef70365d71 ("ACPICA: Introduce ACPI_NONSTRING")
>   ac9334785c75 ("ACPICA: utilities: Fix overflow check in vsnprintf()")
>   5de20bc939b0 ("ACPICA: Apply pack(1) to union aml_resource")
>
> are missing a Signed-off-by from their authors.

Hi Stephen, how can I remedy this for 5de20bc939b0 ("ACPICA: Apply
pack(1) to union aml_resource")?

