Return-Path: <linux-next+bounces-5734-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1F3A5BDFB
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 11:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66A251889218
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 10:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E571EDA3A;
	Tue, 11 Mar 2025 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcWxOy+T"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2C3BA34;
	Tue, 11 Mar 2025 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741689357; cv=none; b=Z/m4Gaqc+Hck26pIgg0whkpoEGd5gRWRmutuKdUzgvFrAc6ysumTkeBxk6bkj4NJc94leds1mTf29GMIKO+QUT5ykWFs+NgNFKsaUwV2Xq198wt1dOm6o4C0wQIBcvceZXFN6OealU+q/8AvQjhKf98DpxwZG28AIIIMlnx0/Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741689357; c=relaxed/simple;
	bh=UxDskpVLYU61Yhkdp0Uj1euBtT7W0h1UniNT/9Bub0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dmb5Msq3kboOTwJsVRkLYqG5WsS7sy2FRHqTt68Vx84ETl2xvVZhwUSDy2E+ppRGYZb4GNWlQW7rHRDoF2gg/NTRVBjTkU5j5G0TeqGerz2zOjFN1EkeaYA2fGRo9wpwz34hKuen/GVLNydgdTKe0V2N+/+iiOkUAaSilDIxk7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcWxOy+T; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2240b4de10eso12102365ad.1;
        Tue, 11 Mar 2025 03:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741689356; x=1742294156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxDskpVLYU61Yhkdp0Uj1euBtT7W0h1UniNT/9Bub0M=;
        b=gcWxOy+TeVBDelCLhWQAzFa1dqY6Psq84hW/Xr91qvdNqKu4cmAgylPDf/pvlC7SH5
         Tld8eF1d+5v/RJwReOELGKtOnWkuNGPzf/1nuUAK3zojCOZ36rI6PLYWPhEwYSaipDgA
         29p5Tb/t/i+BC0hS1ZNCjCmS5hGYDWn+uVaHWA2DLrrBcyqCMCKW1CgysqR4tzAPyw2f
         5KYRoUMF56ngtO7sex74RQJJ5IuiazUJCLW6HJ1CpPmGiwkGitfGIgSEChbQy7XzIWM4
         9+XruF+Ig0B7jdxe7zo6xT/L5zUNPVS+VpnjJn5rAhx2XT+afM9+HT5Oh8gpgGYyaeba
         KN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741689356; x=1742294156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxDskpVLYU61Yhkdp0Uj1euBtT7W0h1UniNT/9Bub0M=;
        b=cZHQFENvWzdrG/D4LY/l3ogVEh/0ZcPKdpUEZOeWWB1BufH5/dyAJsTaVSSTvzmsAj
         KMgHMk0OikeW4sYd+fQtjIen09rM7YwAakVX+kHjmMa8G5Cic5ZqevMLfkYKDwVi6GU6
         j2C4zh3NEpl75PSredt4stkDHGnU7qG/+zUxMTgsKfXsl63rJFvlCkgIsJQKPVvDCx4u
         tOuiZNzWMxeDJSqV8eE8a/7N/zv9oAPzClnKQ/aZ1CCymzKWBdqgXuHTlGkAOHEdzFz9
         mPHsH6DUsy2sWBqrZc8dicMJre/XfdxTK+iGMAbQyeMVaOfWc0mMBCSNXF0TWwQpiZMD
         7hUA==
X-Forwarded-Encrypted: i=1; AJvYcCXRUvMru7EtGzNrXgDZTFpHWIX07ooUj9uWGNd/+BOMz//ZILDdU8gerWrLiw9nXqA9B7x26FYENLZcCx0=@vger.kernel.org, AJvYcCXVPimWKIfbcvo+XGQQiR6aMgMzhio2Y6OqM3Pw6G8iWgjZHy9ryLBgxmcLA+FIKIohZcjBdDOFzPEpkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBAqPVFuPuP6xZ0uAnVopqqNcHY2fh9F+Wm7p1lFf65RW8wgaR
	jUDRYz1AiqX9tLsn1LuTe8u14LcoF5YO+7QfIMprNsIGP5vqImi8oN7Wz5dqFEciCVMEzogjkqb
	/j171HSm4I5o1oJLk1B0C1sUz3uU=
X-Gm-Gg: ASbGnctnNHMYoDz9sVi0qXc5IGbebzJ14DhWdohMd65a8s5f06N8iRDO3zgSretDdeF
	zQmBotSk5lrXdA+py74vyHP50XAvmdfuyVV+MfaGJT9pgWGZ6fAO3/fu8tg+v/3bU9cjy92s0w6
	Akgk+KPzDVe9b4U5STx1bRYsnMVqJssejQ6PU7
X-Google-Smtp-Source: AGHT+IF87YUiZ+c5JOKl7/uEv8ins8dVWQu9guMI6WW9ct4VPV38xmxKRqCghoMQdNmqmGUU8pbk7zCcBU98rWgQoGs=
X-Received: by 2002:a17:902:db10:b0:223:5e86:efa9 with SMTP id
 d9443c01a7336-225932807a6mr15210015ad.8.1741689355745; Tue, 11 Mar 2025
 03:35:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311201726.3f45cc67@canb.auug.org.au>
In-Reply-To: <20250311201726.3f45cc67@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Mar 2025 11:35:43 +0100
X-Gm-Features: AQ5f1JpSKQvJcLrhKtcF2ocDtAMKZaTGndWlR_jK9p2w5k5M46BDlLORXfeX0qA
Message-ID: <CANiq72=_jVDkSo8Q+it4_6-UkTEVxD6xG82aEPcpAwGQpKAB2g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Dave Airlie <airlied@redhat.com>, 
	Alice Ryhl <aliceryhl@google.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
	DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 10:17=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> I fixed it up (I guess - see below) and can carry the fix as necessary.

Looks good to me, thanks!

Cheers,
Miguel

