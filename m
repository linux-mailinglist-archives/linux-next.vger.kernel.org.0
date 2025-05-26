Return-Path: <linux-next+bounces-6930-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCCCAC3B31
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 10:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D45D31895864
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 08:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666F81D6DA9;
	Mon, 26 May 2025 08:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAD7VAsS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A291DF97C;
	Mon, 26 May 2025 08:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748246998; cv=none; b=ArEsOOTt1LXDqExkTMOFLY7Zw2thZKKKHz/5k9WfJ5IK1whVQWXAx6dV6fcHbnJlx/I5YqLacTDl9LCbB6d6qN0g3ZZFXdXv/VRoVve8qtzgaHVq/szvCy2ffe0HmB44SAvKhXdfGBS9pnNMXFZfoCdm0fQPPnqXZ8NZSBaYlIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748246998; c=relaxed/simple;
	bh=3wgDpCfKk5dLFUU82aVAtJS9Vp6h+HBWtctgcOH3OxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aRUZvskR7i2W7meVTuWlt6hgyjYbPHKHO3kmCy9eGYBtaegT+8DZ78a3AvQQtzuYqRBp7yd5y+J9Hs5+VXRcKOtPPcWlDvxwWb1WPymoWCKzurixUY72V5H0wF0IkSshXY38GXEhxPYIehplM0K1BoxAlGQGtgkHeVPMVME78pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAD7VAsS; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30e85955bebso372440a91.0;
        Mon, 26 May 2025 01:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748246995; x=1748851795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wgDpCfKk5dLFUU82aVAtJS9Vp6h+HBWtctgcOH3OxY=;
        b=PAD7VAsSQ+Y361WGzZjqFjCkTkcMm3ng4mptuH2n75BYZJ9vGsniJH8wLtOq305QNY
         +hmXLFW6zZm3qwbTxlUJv9uzusf/ClHK49Cnnef1rqOxV4OQBjdU6UYx8ZefbSSiXUhD
         oHiavuKA7rzh24vetwP8HGM0qeuu2NN762ILzRR/qCL0DiRyFMF6cBijywO2aW68thgp
         Aj+JBQwj2ni+MfeaVK5tfu5l61JWA//elu6oYdEUSIiUAfSsW2mZ4BnW9Micqj80aTGG
         3IXSvbxC54yEHJ4wMwwApMw8GAPI3XUHOE3RAEUGAx4Nh3AkmsKDq9plj15MH6RnVPO8
         YuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748246995; x=1748851795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wgDpCfKk5dLFUU82aVAtJS9Vp6h+HBWtctgcOH3OxY=;
        b=a8VKCsr2Dvf8aYc8/RKbxS4QIVhr3XFdyDAbGziFVKTe9h9zaLRiZ+J7FpS73HRw+1
         neSynRXqdfboBdPUzkCiIpvmOSTEoFjzfs/IN0CuEGNXr8uFx78IPcl2pqCX/pJrGrt1
         eAzG5VxqvecTXtrmPUED8OzSek7U3etUJ8JWoVUIf3xCfJX34q+Nh5ukQ0Wqo6FPLZff
         phInufFoDNvDuMMkeNoh9GVFyUMWDdzMfmD8Xh02ODwz65YtxbIpfpnU6ZykNBId3Lll
         ypTCojUJQPNN9efpHvEGr5UiQg3xaHAOoQybFs47PqNqr5ACoCMtpkz92CQFw0ua0rD1
         MLIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRDlxuREUA+yiMsc3YBlhA2C9nK5uGCNXQzFHh1DJAiXG0lUkHuLhtJ3wwRLsI0e6TmE417EMMVquxow==@vger.kernel.org, AJvYcCXTdP43dZmXIJC8BnHcNvMjqrCAMve32+e/dgVoTlHea+m9jj6PYLkOe55dQagpABs0/Z1ydiO2iKVBFMg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3M3MmcyDVFK0L/FqHbbx6JM7aLT34/kIOr43r7KWr4r/F3410
	abH/oNL3a7TPqpHSvqCfA1A/M5IQuFI/TDNUGDMEPSp2ub4GEfP0N8js3l9AfqIy+0Fz6NXfOMD
	ncN2hlCl6Oxqdk5GV31DVWql7uUWFm4w=
X-Gm-Gg: ASbGnctR7EfIK82Mj0mPOlsoUe4Z75BHVo8WKeb1GT5YN42hgW9tjltXyiJhgqHPQwO
	pWl91ifplwqEkazeYHMMy87XiESNMU662qi5LclBD677R719FqmprkWMvJ160XSogPP6ZPWkLep
	U59lZYsbxF++XnpwQMaYd5i/WPzgY2jOzU2cc4G3m08HI=
X-Google-Smtp-Source: AGHT+IGLm5VPxg0X6dBNtcr0JNF9zqgdm+B8CJmntoUPN+0P6FKoliOrmeyuTZia14JydCLUHz56hetu+QdJTlJXCyc=
X-Received: by 2002:a17:90b:1d81:b0:310:8d54:9e7c with SMTP id
 98e67ed59e1d1-311100da1d9mr4669488a91.5.1748246995131; Mon, 26 May 2025
 01:09:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526173741.2dd77e75@canb.auug.org.au>
In-Reply-To: <20250526173741.2dd77e75@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 May 2025 10:09:42 +0200
X-Gm-Features: AX0GCFvSYEuFmf_t0F5-zrHSXkJ0bvwRRtF5c3d_4JlI2Qo5Laeq-tZgUflRjB0
Message-ID: <CANiq72kxbJNpnrs4ktJLN+eiF6HjacbCOw7_qs5sKLRLN0PhqA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the mm-stable tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alice Ryhl <aliceryhl@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 9:37=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I fixed it up (the former removes the lines updated by the latter) and

Looks good, thanks!

Cheers,
Miguel

