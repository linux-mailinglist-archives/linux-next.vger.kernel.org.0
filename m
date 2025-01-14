Return-Path: <linux-next+bounces-5198-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 554CCA10240
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 09:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75EFA3AA01D
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 08:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5202284A75;
	Tue, 14 Jan 2025 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcNjnX2w"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581BD284A71;
	Tue, 14 Jan 2025 08:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736843953; cv=none; b=HOs+YJ1tkdzgayKI69rQNM+Eho1jyQyzZKzIwLNJ32UMHOtPVNoQV69VL3HNNULWfzSZbohb6sztI0uwhP+O92nVOpm5mif+inotz7lEpHoytwUBDqlt7Un27nDxDD55ZAj0Gpq+tpdH6MuYlo8YnqdkppDVIlfdEKe4/8q5gvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736843953; c=relaxed/simple;
	bh=+qR8WHnyFwDEGcp63tqSxJY2Xu4eLRiNhrBaFf8hO3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUOLc1jQB+pRLTQNp7nzzoqD5PhhncTXkx8BSdXd7/K6aX7BLRLdY5sHA0VYJ8WbHbfCN6khE5T+fCozjJ9emc9UU6RNAkr9OML5SE0c61BoxEu4ZuAnfiS88I/48TAy0q5vCuaQx94YoaWvNdzHDYOykJy6UBHdyYzuQMja3/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcNjnX2w; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f2f5e91393so1113764a91.0;
        Tue, 14 Jan 2025 00:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736843952; x=1737448752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeHuwGD/z4YuW+YkGpstG1Jpf0LqgZMMt+D79A9D4sw=;
        b=YcNjnX2w2uvi7t/BVMWMUkou52zC8MOlN0SAunmD8mWEbk2KwKiKr0cRTh9SXZO9tk
         FSSrwyyXYfMxcRFT6janUrk2i4tXSrS8k2SyPwZJxLXkpH7753IEZqWEL2hBksMXICfm
         NTinP8MVp9DdWTTNI+Z9YdMSfNzfgWjF21bWRfs0QjCcuo97tW/ZPMZ3D+EJQB5iyMeW
         GX8XE5Qmi3VksYi8OMnwWeiGKyUuR/JmRil0ueHyW5jax+wTxbpaqd9fuUZvKV3K16nL
         4/lIWPZ/HID7z1yMKmVLf51rxrq48w1bVq0Pcd/v5ulkmTB8vgz4IHrfhv7eYfiKIPH0
         F17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736843952; x=1737448752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeHuwGD/z4YuW+YkGpstG1Jpf0LqgZMMt+D79A9D4sw=;
        b=R9EsY54P2tEDJo+svhEisYLxyJeMjJS0K+Hk/zyLcaL3G6u+CN1hk+qbbbcWA3xRPh
         vvyMiOvcgA57Hc6QngoxwzL8gz/LoRPD0yg3JbiGX33HXctsP6vz3qS0HAJdkhR3j2mr
         2eGi5ytIjrSP22aVDIpvjK/eF+yusMaUj4LAza3FU77rHX4LzrpGk4kZBWEBkc1Vy94a
         4zVXfRq1lnIgzT08ysJhTcI0hfJLK2kEGy7IxpUbIz6ZqyU4+r51x5WNsRRAxmks0YFk
         2yvvnXO51KYt9dXVrqjob41kY36Admb24ZV7R+/CTUkqxi1oai3DnLFjHtGnsK8sbwoo
         jYVA==
X-Forwarded-Encrypted: i=1; AJvYcCVYxHFZZ/0XacGUm/LewlaTPJqNrtRcMNwDEfqu3rkAyuRjaNcBYOpP/4n2XiVB+IzMo7qpDYvEjMkKqmg=@vger.kernel.org, AJvYcCXWeu0Jkk5Zz+ZYTZuzZ9XK3MlANt9MPzbh6eTdvNewbF4YHDKkJmSeMIAiwPJCNdweyZGvFjCTwlVd1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjE0I2o0/WcQbPFOlP4+S4P1tMpPTYvGVzjTk3EQvx2I3wOuhy
	+/9Ctw9sLRzB5viRPNfdB3Qfdk/RA9/bVbsn4SA/N2Y/fmY+kETN1rm1N/OFlryocY2zUrTJJEO
	JkBpf540HWecyzb1xv2xF9kBlp/A46q7wsMs=
X-Gm-Gg: ASbGncv9/9zTril7TRvzbBN1HkllrA2dqVzbQxansRowWCLNrKvDa0sdXvHsnbwb8RN
	WaF9UTDFYZ5yXmubdbGNtCNjE1pCZu4msJD+wug==
X-Google-Smtp-Source: AGHT+IFMmArj8FU29PJvjUllREmxP8t3VRG+Yl1WVBt1O8pHmRalY/Bdi02fLNyB0AWjH+Vjq2DnBy3sFWWrPd0/bRI=
X-Received: by 2002:a17:90a:d2c4:b0:2ee:f1e3:fd0c with SMTP id
 98e67ed59e1d1-2f548f75c6bmr12277800a91.8.1736843951619; Tue, 14 Jan 2025
 00:39:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114153733.1b73c3df@canb.auug.org.au>
In-Reply-To: <20250114153733.1b73c3df@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jan 2025 09:38:59 +0100
X-Gm-Features: AbW1kva20PqOBVyotBjV0v1sBRrDo-0XeTOzNRHziHYSa3PaQJ9VozCBwSi9S44
Message-ID: <CANiq72kYUEsDDym8=X7Et4YtSoaUTfLTpi6EVrpmz6M-sKTFDA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, 
	Fabien Parent <fabien.parent@linaro.org>, Gary Guo <gary@garyguo.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Xiangfei Ding <dingxiangfei2009@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 5:37=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   rust/kernel/lib.rs
>
> between commit:
>
>   9b90864bb42b ("rust: implement `IdArray`, `IdTable` and `RawDeviceId`")
>
> from the driver-core tree and commit:
>
>   47cb6bf7860c ("rust: use derive(CoercePointee) on rustc >=3D 1.84.0")
>
> from the rust tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good to me, thanks!

Cheers,
Miguel

