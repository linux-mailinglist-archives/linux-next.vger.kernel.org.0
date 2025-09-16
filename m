Return-Path: <linux-next+bounces-8320-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3CFB588CF
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 02:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 511531898B7F
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 00:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3FAAD2C;
	Tue, 16 Sep 2025 00:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuPIgXvV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5688BEE
	for <linux-next@vger.kernel.org>; Tue, 16 Sep 2025 00:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757981109; cv=none; b=m3KvlSwke5b0nKdrJpqDcJ4/J5j5zn/ZAWrTX8P8Nn9FCw9UhwyjYhn1UVKJzBysaRc9h06AVjiyF7jOWXpTw6UhLugv+ZL2LLJ9ef8h1jblqrzMafiPYk2Uj/F7F7J5Ppidj8pyV30G1FC25z7OIeUv6TFd0tMV1gOHmoeusX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757981109; c=relaxed/simple;
	bh=8+KD7NMyyKZmUdc9ijSlgPtApsqokZkOOSakm/49bf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UH/eUM05wYvPC9AXA3aNATuLXugsJ6u5bo+zm+f9HJO6c+fPXczYiNNwcj1px6cZzZrIib97d0qjZ2VtY2GS/qHVlW0+ujRpX273XXxgcV25VkEfAdQAbMrE+H2WVUA+Nnis7iuCuClNtL+8aZjRgKmiFp0b6j36jQw+brYqNIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuPIgXvV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-24498e93b8fso6957075ad.3
        for <linux-next@vger.kernel.org>; Mon, 15 Sep 2025 17:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757981107; x=1758585907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+KD7NMyyKZmUdc9ijSlgPtApsqokZkOOSakm/49bf4=;
        b=BuPIgXvVLe9wvPLXBrWOgg7TEnc0nUpYKxmqibVyUR/BACgPyqWi69rz2qsoquPbAj
         rTEjNto5+fpq/DSoicp3HfiroudSidbMI/Fnl8lB4WNUuGtj0KIFFdAvERwPkGh/k1+t
         Qry+cZepHp47FUnWhN1mlMPLoN66glH32iTG/t4CU+9xBfE4jBi10932anqrW2T9G2NL
         PhmUD7UUu1okuIzKQQTzfkUsqtMQfpTdPT209eOAAkrqJWhx3WbHiJF4jBpzWir746bS
         IvAq5k3OYZtNpmDAvnOyXqW4mlCawGlDesCYsFRPYcqPEOZlgn17t7GXlqoezk4kOn2C
         RQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757981107; x=1758585907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+KD7NMyyKZmUdc9ijSlgPtApsqokZkOOSakm/49bf4=;
        b=pKJ5Rls5pEv+/LX0HfYhUYFmIpv0GJdQw8rxspsqsNrTLxO6O36KmZi3zSZhDMlOIg
         tfUVfpsLJgR0cjhfZ5yqyWi5rImV8zF5zyt0fnFTonncruMKcNcBm1LEOReSFVXvKvhu
         lwTFDy96F2BetgvGX12GjNyCVwvbj7asLwEdWk8t/ml3JdosjSlnG0rBongmi/Uo6AAl
         Wptuwmrvyp02HNgo7k2kIrJ6kt9bYLu/BRSsrHIk7ue1TsOK4sbhqdZm8og/nnQ3EpBd
         5I3dbKsdkR2LLnoHhogDuOJnKcdWKPBFUNHcAQULsSWpTRIwUaQv+0/8meK5znYijEm2
         SBxg==
X-Forwarded-Encrypted: i=1; AJvYcCWXebkfKB7+e7ZeRPzYp9HHt2G59UADXzky9A0aE0SU6TjAyGdpaZLA89NVFpCFkydRAK4mByoLBvT6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq3rDEtb3rl3U/sqt7zMsSOJcieRPksAjujE4E8LJnhhakmzc+
	z+GsUu96/GCweMVax7gRH6B7+8o11FJRR27O9bU+eTMfwbwA1paincqaZWmDYzjDB9Ic/9fT4vD
	EKNc95jv9jEo28LiR8EnLSQzu+t0h1/TX+5dDRD8=
X-Gm-Gg: ASbGncsW0hSR1bPrEevYyHl9/OV9/XDA03G/Sp2fzVrhv2IBkLezRen8Y3si9aWH92X
	S2shEkT44YVYqhC/OgflDKfS+i9dbEHEpYNWfTZSBZc1DFqHp63hfyaBtMVVBtKDXetqdHn+by8
	EG4yBSH1uZ7Sfd4LqZSZECl6UdRQ4EFkBp+0SKJVhqVLhWPaMy1lUzNBsXKVDcJP6LBqyFdDntK
	0h9KRtIbpTSxp+PPbZg9r1b8zfV8yw/Jf9VQaIwdpJP3I3ku2FP6ssucQFl/PJUP+F+oeS85SN8
	l/J3/VUCLPGujjLsYkaPeSDKSTjPaONoZzGW
X-Google-Smtp-Source: AGHT+IEINeiItjkyrQ8EZg2byQGb8zEsKoTssAR7nMkdgp16h7prJ4CT4z3/pRYUORq1x2zCi/9P0hjJwiePlKwNzWU=
X-Received: by 2002:a17:902:c406:b0:24c:b36d:637 with SMTP id
 d9443c01a7336-25d246da083mr105124925ad.1.1757981107273; Mon, 15 Sep 2025
 17:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aMiZpcBu2LDzwCje@sirena.org.uk> <aMikrcaVbSYdkdmW@tardis-2.local>
In-Reply-To: <aMikrcaVbSYdkdmW@tardis-2.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Sep 2025 02:04:53 +0200
X-Gm-Features: AS18NWAbBrjqoU-TnPCKTrXC4mUz_DxmPRzAa5eZ5sT6APLDzi4TIOCXScmMnIE
Message-ID: <CANiq72k2N+7NG0NnDMjxLy6_zdOhQf0xBZq543fj9vONKoweDg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the bitmap tree with the tip tree
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	Burak Emir <bqe@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, mingo@kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 1:43=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> [Cc Ingo, Thomas and Miguel for their awareness]
>
> Thank you for reporting and your resolution looks good to me.

Thanks Boqun, looks good to me too.

Cheers,
Miguel

