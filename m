Return-Path: <linux-next+bounces-8434-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F4FB9192A
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 16:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65BE31889E71
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 14:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94151547E7;
	Mon, 22 Sep 2025 14:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g4XktSv8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720C2134CF
	for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 14:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758549896; cv=none; b=UBGhiH8mSuaClC611sM15rGAL4NRE3ozUzmZDuZZC3FtGkwPEsLZOKmzV8m8Ch8fKnrIWU6Wbq3cyCaeGs0lAxnbqJai1e1LtmehAGpe01PuxEliGhKGOpzcmCPtz6BLqFwSv8qRsUevRmgy5TQqoIzxV3Qf9Uvv67RupZtM9KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758549896; c=relaxed/simple;
	bh=/sjcY9Fa5XFylluVuxusVCNMtRrfJbTjfjaQE20VI70=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CuKq43/NXOt/l8bgbv4NHN0wnlffiPm9Qo136VYhFZswSRa9B0LLAx31g3HwfOop38QM2sXfmkcWeBCM9UmEm7J47m3K0hNonqmRxN390zF4NajII3pTB7e8HbKzZK4JJM6auRWjnME3W7Spec4FS8pEQOB2eF3jmXyD/vouX7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g4XktSv8; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-329c76f70cbso3805804a91.0
        for <linux-next@vger.kernel.org>; Mon, 22 Sep 2025 07:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758549895; x=1759154695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2heiCNaQg0i2C5CkgyQt/hQuQrr2a5K2z0DwRmV5M/o=;
        b=g4XktSv8kxMDE1maJ22CApN4ApUn/klU4pwm5YBmC0PCF09D7aCqp6QRQ3hlol5aM9
         JfgG0YLGlPBa7vliZnYWRQ+RSeR1rz4wxGaXUBv9axkIVoeoWY2sMJFRAE5MhUmub+e6
         D0ilXxPW08Cw9DnLv72tK9oRaA4wFaH8VG3wUx0NdvO0nRt2Ht0GIYedi1d/l+NDAM43
         Gjdtv8YlC1PxwPc/J86LLk2HqTg7m2yDOLiMHpxFzP837OZwUebzZO5UXczQuZvR/uwn
         wDVXiNttZTGwOV5HaO9SANtlcm5uZVDS9Hwg3kfj3FFc9HTnVuDlk3Alem8oNIVA1Obt
         RopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758549895; x=1759154695;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2heiCNaQg0i2C5CkgyQt/hQuQrr2a5K2z0DwRmV5M/o=;
        b=P2amlfVYnOlzudhKdpw3C3jKEYuMgmgg8UXbZ7dCTuyCRK3M8QPi3+WIFNYEjWGqa0
         CZRBUM7gSpTGQsLaf6SQNCbCpVvUTwouf2kOcOCNBtorF72ZbnZsUHM+ccXMq1Q2ifmw
         xsI7DMaZLAG2MEvlztaQCx4eg6AhnZAoDF0hVjY/qqpD3AdRZU09lvOS2AmtTNZHW3rE
         AFxB9fMA7PiiNGPiqjy7Ps22fZ1o5HYBBebsnRIT8iOSHe21GX7YXE/wqtEybJDzTH/y
         sgM6EXGrwY++3IROP9qp7hk7PkjCaFhgqM1hgwRN2Y6VeF/DDI5QJA7stAOFS6QE/ctk
         9p0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU68yvUdutKNEFJwOsDtnPxGh01Eyx7HBJAIkwCBLdc+uPGq28NWDg6RMD476XOQQ9+BxPww5nzeizE@vger.kernel.org
X-Gm-Message-State: AOJu0YxVnZ54Xa8X7/vndkfXgIQ/TOMQer3U9FjJcYJVcUQA0d5cmMrb
	COLeWyGlUA8u6aHoeGMa2jx9GtqxqljGwabEVAzuuBgkuwMveC9UPTj4pfE+xOH3Lp2th3rytK6
	lMqyN9g==
X-Google-Smtp-Source: AGHT+IGL72q1bTs3P0fdVgVC7YK+Ah9k+m4H28Nhfd8zENqra69s7jdTZUpaIiWplJKUQYNz1olJAXEyid0=
X-Received: from pjbmf16.prod.google.com ([2002:a17:90b:1850:b0:32b:95bb:dbc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1a91:b0:32e:3f93:69dc
 with SMTP id 98e67ed59e1d1-3309836d35bmr15727800a91.25.1758549894748; Mon, 22
 Sep 2025 07:04:54 -0700 (PDT)
Date: Mon, 22 Sep 2025 07:04:50 -0700
In-Reply-To: <aNE1s02dSgcJ4Uxq@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aNEb7o3xrTDQ6JP4@finisterre.sirena.org.uk> <409d5703-ca0b-4b4b-a221-4e38ea92ae9a@amd.com>
 <aNE1s02dSgcJ4Uxq@finisterre.sirena.org.uk>
Message-ID: <aNFXgq3SkvemIlv1@google.com>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the tip tree
From: Sean Christopherson <seanjc@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: Srikanth Aithal <sraithal@amd.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025, Mark Brown wrote:
> On Mon, Sep 22, 2025 at 04:57:39PM +0530, Aithal, Srikanth wrote:
> > Hello,
> >=20
> > Todays linux-next build fails with below error on AMD x86:
> >=20
> > arch/x86/kvm/emulate.c:4091:9: error: implicit declaration of function =
=E2=80=98F=E2=80=99
> > [-Werror=3Dimplicit-function-declaration]
> >  4091 |         F(DstMem | SrcNone | Lock,              em_inc),
> >       |         ^
>=20
> That'll be me doing a mismerge I expect and should've taken the other
> side of the merge for these, I'm quite surprised that the x86
> allmodconfig builds didn't trip this up :(=20

Yeah, essentially just s/F/I for the em{inc,dec} entries.

---
 arch/x86/kvm/emulate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index beda7030e40a..7d520da8dafc 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -4088,8 +4088,8 @@ static const struct opcode group4[] =3D {
 };
=20
 static const struct opcode group5[] =3D {
-	F(DstMem | SrcNone | Lock,		em_inc),
-	F(DstMem | SrcNone | Lock,		em_dec),
+	I(DstMem | SrcNone | Lock,		em_inc),
+	I(DstMem | SrcNone | Lock,		em_dec),
 	I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
 	I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
 	I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),

base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
--

