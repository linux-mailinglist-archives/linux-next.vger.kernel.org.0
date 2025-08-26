Return-Path: <linux-next+bounces-8100-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52811B35765
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 10:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 135885E3923
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 08:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E57027D77B;
	Tue, 26 Aug 2025 08:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWvT3P+z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E129460;
	Tue, 26 Aug 2025 08:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756197684; cv=none; b=WCklNkYvF2M52oduNVSqs4VjA11RD0i4Sw3lZvd4cRiDVZlVaha2tlG0D8hSR84cdI1XQ2DML9A4BRbv9JvIKbBiVQOArR7gV6iec0gXAeZ4Mogz03I7lHnMja11BkBtSdKLEzkfTWE2gBxbpAqAYLouFFaNIZwM6y1WpTnVPTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756197684; c=relaxed/simple;
	bh=6lftHUf71DUA4T0bqA8FrTXfH0J6B4vPI5kQZlu3iak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jShPbh4K15quDsKgP/F5aXnSnc8Z+mjqB4wiHldoRphsJUmc3posUr9MStpX2lwXSxKxCir/VmVkZCSRtRQ9MucQONXiTJKesBzXnQH0BAvTiw6thodbEE2RjxYfN3tjqEdDm+vYcXtZD9SkHaEThoAnvM+yQXDha5SnR6f+LBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWvT3P+z; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24617d3f077so7627285ad.0;
        Tue, 26 Aug 2025 01:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756197679; x=1756802479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsM/gomFX2MDoPGDhRP46zbnJ36LRge+C6Uha0o94HA=;
        b=VWvT3P+z0RmQ/4TRGDdKbO9jchZ7AAmuKvm8WN6Fi6Cx8JmtAOYQBNic8ffGcocF+1
         cE1Qjmug4zqsBk30eQL/6J21qjj4lc+hejfIaJSF3melipRHbqZZS3dRsT4sqocM7LnI
         Q2NmgidR4Fz8nIVCFW7Vys5AxkRzfPamG4le2/Infh2Iw64eQukSjjAENrjW/SzFZ7B/
         uE9YyNBhBVU2lGoSPU6JaXIcvCNynzUCYzmrX4XOr7lRU5qrqjDnLvF7EuACKDxjPunE
         KM0NAg+0XZCC/tjQv8RcP2EO9SYT76WLEV5lt/OjFXMKWljgvNA9q4uwG4CLkHNfHcLr
         Sshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756197679; x=1756802479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WsM/gomFX2MDoPGDhRP46zbnJ36LRge+C6Uha0o94HA=;
        b=BFghpudzdZKBgupH/LijNNXO4cfDWsyXWTXq6a2fvhpaJFM83v2WGj0L9VRuPyLSp5
         5+jdghnr7MaY9ke1jbgRBt5OA529v5JybKySNey3COxUGoj4Y1pdVJPeALcLooiphRRS
         YHYyH3amGaKmbDoQ7XcPdaqBznBljjY6h9NXqVnQt9cKDVonYzbeiBEi0oiKBEcbA7Hg
         6ywD60oBCpwpNQK0JjPg4ZUM99VTJ8Zacn29z5g4mWOMjbb34LXeHRoHsC1L/sPfoNYv
         TqKf0QnX5H/98dmfhq8CARB1JjHaDQj2JGzuRVo3m2DaZ4KZjehRIEtyGj0ITAXRkmOp
         BqcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBcVjcwsnSgz75YdTccoqqy93WWAU9gneBhyLI+ms/wLj92rg8IrKTs3OJrsFDHhgVPhDa4nAGCuBUt1M=@vger.kernel.org, AJvYcCW7+Ac4GX+8P+HFURWj0WG9HaqRwS6l6bkh0xvMFfST74ZDuzKp5jRY4He3TVGsP/r4xL6IFSWa3VZEFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU+TxSZ/KFYDkTYKXSyPry/psCeb1itnIfpd7XP2ndMU9Q1zeS
	H5VKTDCNh+WXIBPnxNiIjRbpXxNITtDtE+hUrZ3Nemj7+C4mgybkbcgjRTiLCvilRb5oE3+K49G
	s/FiC7I5zkgycgSvI5o9zduQXEtET8ag=
X-Gm-Gg: ASbGncvSWarmaEqEfox+yahG/c91lczuZtVlPk3ZawiCuMAYnKjRFLNtRqgILqnS1pU
	Hr6QoC5yQiz39DPMevzQ/2XD1D3zeOpqA5PXaVNdnkf1wQXW1FZHhr12rDupZHlLOnanvV9OFT5
	HvXzwUe99p613xLgIlSe+9MA/1BVtZjwxQiDK3X5bUdj3Z5ym1L7VRtEzh/Cpx9sRRZL6kZ6VdN
	Ka9FC4Wc+hWTdZhehqGMe/j/MmmOv74fm5nrdJnOjlKkZM0DRy7a8K8a2AaE52YAW00jcssoj/3
	NvCsiqMI2lGjV5L3hc18BRyJmE6unMCUZVev
X-Google-Smtp-Source: AGHT+IGgUd3cCw5hoPcSqxVJsTVEGdnQtn/6lCN3HNmE+fc6RAadH31yG60gx4CJqcHEUD1Lg9LJODBA+S34cf8KfmM=
X-Received: by 2002:a17:902:c402:b0:246:7702:dfd9 with SMTP id
 d9443c01a7336-2467702f08cmr76116925ad.6.1756197679484; Tue, 26 Aug 2025
 01:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250826173041.3140da7b@canb.auug.org.au>
In-Reply-To: <20250826173041.3140da7b@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 Aug 2025 10:41:06 +0200
X-Gm-Features: Ac12FXx7-KVTFlOMqBN0AFgfUOGYkYDCZFfOLj9hCpjCtkzCPViNyRbfTme0t1A
Message-ID: <CANiq72mzK6BifSn+tWK090U1VO2FS2J5WQvX5O48D0MRDiSs2w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust-alloc tree with the
 mm-unstable tree and Linus' tree.
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Danilo Krummrich <dakr@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Vitaly Wool <vitaly.wool@konsulko.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 9:30=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Today's linux-next merge of the rust-alloc tree got a conflict in:
>
>   rust/kernel/alloc/allocator_test.rs
>
> between commits:
>
>   501046225a67 ("rust: alloc: fix missing import needed for `rusttest`")
>   c8a3b6ec0370 ("rust: add support for NUMA ids in allocations")
>
> from the mm-unstable tree and
>
>   0f580d5d3d9d ("rust: alloc: fix `rusttest` by providing `Cmalloc::align=
ed_layout` too")
>
> from Linus' tree and commit:
>
>   fe927defbb4f ("rust: alloc: remove `allocator_test`")
>
> from the rust-alloc tree.
>
> I fixed it up (I removed the file) and can carry the fix as
> necessary.

That's correct -- the file is going away. Thanks!

Cheers,
Miguel

