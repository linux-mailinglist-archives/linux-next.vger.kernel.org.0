Return-Path: <linux-next+bounces-8338-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE083B59812
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 15:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9D5D7B5506
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 13:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA63E31B829;
	Tue, 16 Sep 2025 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFk/nKl1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB7C31B138
	for <linux-next@vger.kernel.org>; Tue, 16 Sep 2025 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758030322; cv=none; b=t6TFZNzTtoHZ65nyGwRg3qwQjbEe9rSwi2ZD+NqByAXp8T2W/kRE0Ykx6kwCbIogTaAbnBVo1kzz2uXa5OAdMtxFQym8HYKO5lQXcDg1UCgjuRUoYC4vBDJlJgwbNk6Ljms3CfOdobfrlbjOJAPDNsDo4xxqxnhxcYLty7uYan8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758030322; c=relaxed/simple;
	bh=I0s65qDgowOOSGjJfE5946fkY4IW8WBrWqqfNZeJx30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gSw4iRvdPhEnPkTVY4RpAMXT1mJES7Y6RA+T8MxIqPZ6kuy44t7q/9E/dJDf1pkQo7jzRj8KhbrxXGbqUSfH6GSJ3AMmz1N//g53TzM9O+pVSEL1holJux6Tgh2nKx3ZtuYgxytXUS36SqfwF6AmgyUoQJ8OCOW6tLQNLaqQ4SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFk/nKl1; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-24602f6d8b6so9834555ad.1
        for <linux-next@vger.kernel.org>; Tue, 16 Sep 2025 06:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758030321; x=1758635121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0s65qDgowOOSGjJfE5946fkY4IW8WBrWqqfNZeJx30=;
        b=HFk/nKl1AmP1c2SeSLEf6JqGrRGVzBZlYA403wUQt+oePoRDgA8df/HTeKL8nLkK/q
         HsEnoouOoIpQxx+gt9RUWvQEHXPnKt4CxEsFRj7UKf76bX1LsmsTONLbmIhGtsmXlAy7
         3U6SX6hGPsA4qSc85/teb9QwFN2ZzmGWz2ftZRK/Ap2H/u0gL3MZ7gny+OvryTrPqb7H
         250rz0aOZDoy4fmIBt/3eWGrl7Qzomhb0GW2jMFSlNJUdtubfECf0VujXhEhwxFvthvz
         6NJn+N0IAYcpaVrMfYoyzPKkMttiGluLNfUbO/As875H9oiBMuQqYQBqoLCu8hUEGX7M
         wKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758030321; x=1758635121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0s65qDgowOOSGjJfE5946fkY4IW8WBrWqqfNZeJx30=;
        b=YN/k/r5pjjh6/uIQqv5Ezwn86DK3kiPUm7361Xf/1qDNPtOGRPdYLzYRRBAtUSGlcy
         fOzU0RgshQRxCqrrKxSu/bPwCKEO9H/7RkycZJQMkYN9xYS2/IPHo2f36Q7x61GQL8g1
         cA0ZNDv409bihrUg7ByJoHD7fT8iwaadSStDGNm6bim95QBSICqYITI64/GyzHuTUJmK
         Y02SprqiHEpMWSWh17X/xDq8BzU96Xi5zyD0QS8erN0U0GJnxJBcMIKvuh2co53M6Wju
         34wA4dqT00ouYL9EAf4xb+wUIHPvqvyped/vJuFQaJ1PnAB+hTNDeY4OS+WgctMYsUvv
         iqYw==
X-Forwarded-Encrypted: i=1; AJvYcCVtJFn4/k9qptKu2L1et8HiA/uwOgIxE1wT6edXcjGpbRAfOBAbSQCeCh4f/cPSQMYbg3c3cn6Sbrll@vger.kernel.org
X-Gm-Message-State: AOJu0YwBA2ZHBNVwq0gbMyAHZs6dxLCeHOxkJJ9Lvq+I64+gSsyCyqqt
	HvUj/9L4uhFMmnxlB1M0PKQCHtMJFFsj0wdEOOpkkI/Dv1s43cMYrjK8OSg/B/C3xTWqWN4DD0I
	NvxGzwO8nMdOLgNyDanapeAlnODGN/oQ=
X-Gm-Gg: ASbGncs9x3boTUiq2BnRm6rH78I5T2ElMtWtpB3OQx7Ba9eUsvMzJ178ZRQOKdK/Zq7
	mRfJ02BtACAv/yOJ0oaMWUhbAY7bBw7gjI1tDX5ewNKAtjlwbOe6qIMoBeWnESUcMCGPTUqO98z
	RkNJGbvajSd0+4bQpV+c32YnR6UyQNfXlhjw4CIUMTUYSMeenPfMRemimmmMXTYSIS77KuZWvqR
	7thQcpJe/RjCCGyxpmOJUAt1wXJJp5lqiZJZXeg2IveIa1sm7W0OY/X5K9kEsVRzyZwCsSv/vWw
	uNTyZvLKH/UnaceOmHfTXdNoAQ==
X-Google-Smtp-Source: AGHT+IHPLqw0AIyLnHcYCRTMF/ApKTmwBc5zMDhb5jtN/lV+nldHeK1DvNtke7/9TGrkHZ1QaUkr4x3zM5ESSIJ5CuA=
X-Received: by 2002:a17:903:110e:b0:257:3283:b859 with SMTP id
 d9443c01a7336-25d2782cb52mr108934005ad.9.1758030320734; Tue, 16 Sep 2025
 06:45:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aMlmYa5UjLe_ATl_@sirena.org.uk>
In-Reply-To: <aMlmYa5UjLe_ATl_@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Sep 2025 15:45:08 +0200
X-Gm-Features: AS18NWBP211A49aVaEolds3E2GGLOIpvDbK089X6BZlvKoeEt1Gp-RB0UbsEPNI
Message-ID: <CANiq72nyVk98nw7L0vukZ1fE+Sj6Eh5RzYpUsOqUVPuRE7fHKw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the vfs-brauner tree
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Shankari Anand <shankari.ak0208@gmail.com>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 3:30=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> I fixed it up (see below) and can carry the fix as necessary. This

Thanks for all these Mark, and sorry about it.

(I may use these as an example for my proposal to have a chance to do
this sort of "treewide Rust cleanups" late during the merge window to
avoid this sort of thing for Stephen/you and others.)

Cheers,
Miguel

