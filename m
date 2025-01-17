Return-Path: <linux-next+bounces-5242-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2129FA14901
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2025 05:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B2AC16A8ED
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2025 04:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959481F6687;
	Fri, 17 Jan 2025 04:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sc5rc0aL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1E825A638;
	Fri, 17 Jan 2025 04:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737089918; cv=none; b=suvXn8JtO89+86MrQPXGppadg6YB8r3ejA3SMIM2vmIP5ajoQf48kUJRpY7sy5vjxy0m2vQsRGAB5oDi1K4d8w8bnHHXyQnFc+NVNR0TKham5WvD9t36nIDUvqY/d8TjpTJ2RWYOhA9YIqRVBQqYXAtFJVQFePWQNx70Is5hjj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737089918; c=relaxed/simple;
	bh=3TqEPNi+NzA6NIQjC0HF+H0p0Co1CYEKZJj+KUSXMK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cetxr7GY6qdiNBDh9gxCTWrNbGgWsygo3ah0v/wFsMaERksRbtmZ3+Kr1HuyQOswAvjbxAnHNJydjy36zrY9bHPnBksyCeph+BwBr1xBw27FtSsy2/mJRkrPIQApFV/CWDGsKJiUU9n/VGwXRq1twngHoHDQtWZZ0RAzL5XeRx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sc5rc0aL; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e399e3310so1831690e87.1;
        Thu, 16 Jan 2025 20:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737089915; x=1737694715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tzm9lH2OYi1MZ0f44oUVEAvNExW5oZ55tRiGLF5Rq1o=;
        b=Sc5rc0aLHZPrYG2uvdNLjm7KZWGPe+XVfbFV/aubEC8KUNJHqgw3vBrl6Uss2DKoFT
         YNJoXSjWzj4XfyLXOJ/QNOJC5/pcDZyB+iAwhfGigDjDPlFsLYVOnAZutTokW5cMthUu
         BoLWk+ASNnZiAAxqWhhuVRRykqMcBMqwQ0ZTEvtkXS/lAVwE/NGOd7ypSLM7Rb2r09iF
         v1ta3oTq1xnM5qsBidwzNvWz8uCsew6ptP/yZtGKjUWk1Un3hd0l86BN6F8FPc4QEkNV
         oYQhmHrxyvXsh3o1E2cT5SBcSgvUcQ4Zdeb0IzrOdAZT7QhlEzXqdYO4vX208AcrAqsM
         pX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737089915; x=1737694715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tzm9lH2OYi1MZ0f44oUVEAvNExW5oZ55tRiGLF5Rq1o=;
        b=lph8gXDf0DfQHlREGNVSdXp/DZRAkMruq3f/XXyKBC0EU2TThkgiFW77oPA0pVkeOP
         vtYanLB2p29psJy2gT9pMNRhw91b/56+LHimsi8hXAmXz34fx5Ade6GUdLcjK0CwhBIw
         Oz/bb2WQQHVfGfDrd+oz+BfQmR3IEIm9+4KScl4EfC0+va0pptpHzZxYufeQeWf0ru73
         ovy+jvAqma2RMauMXcWudYcgoJrxIy97zjIYm8YaIbeeI1b+p2s7a9hWj9Es45QgWyan
         hATOTPx0LbKK+oQ4dKMU2Qz/IXHxXulytZqmWikQ7tZN//LJDgmvcXp2LIr935vqar2z
         E2DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCNgD512/R5hRq33US55xR3aAq5FMo7PEAzRP8dYwifOrjSCkNuGohS5Q48UTI4HTrK1ZAt7Z1G37l@vger.kernel.org, AJvYcCUZ1/nLEA2NGJFbM0vnitwjjcRwtqPyP1Fqp6FG5MzeF4bwQffEHkhCADr0vhamNyBAL/gLJBoWUF/dcQ==@vger.kernel.org, AJvYcCW9YH/GahgKKK5LGyp8oaIBvToNWJ+x6M62uyXeQcWieNYWkbapv4MTZ2zs8lOHsmfX9RILuUPGJwc6hTsw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd6Pd5dKVCNUModT8Gvn2JCL9XbMUnplDpYK7+jZbFUg8IdxNl
	ZjT/3baxqYJbWu7kuSCYT7xf/GudDfKDGJpJZxIJeVKjcyuC86Nc0nvyUbzoG5pYDBsh2m4x+xe
	xv0IaSurJt11byl98DV6NjBrdU3g=
X-Gm-Gg: ASbGnctZXcj/9qvVqYyF4tJ6OIoevX6YmyfbLa962gPuFKdlw4gHBc1tw9Z63kIU+m5
	89KOxE2HueUQSQoHhVfWylzYnZMXzFq0Qh/k=
X-Google-Smtp-Source: AGHT+IGwF1J7J3gQBGnFggK6bM6nqcnuI42aL/3XsDpeNsGwx37aCvL5jAHp0iJbMfoNN0/iE+2E48+BEjvBEnEmqm8=
X-Received: by 2002:ac2:41d7:0:b0:542:62e6:4517 with SMTP id
 2adb3069b0e04-5439c2289d6mr222726e87.12.1737089914659; Thu, 16 Jan 2025
 20:58:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117085958.0b91a98b@canb.auug.org.au>
In-Reply-To: <20250117085958.0b91a98b@canb.auug.org.au>
From: Steve French <smfrench@gmail.com>
Date: Thu, 16 Jan 2025 22:58:23 -0600
X-Gm-Features: AbW1kvb_jrwwrP_0HuZJ6nbxdk0x_xiz8Nep63SpAzmpYwKkz6vYawLhM5Jlw0w
Message-ID: <CAH2r5msnvt3KF7Ro1FHrw4ckW9ZrqhgnEBaZ4YSPb_tTyrjXXA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the cifs tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Paulo Alcantara (Red Hat)" <pc@manguebit.com>, Steve French <stfrench@microsoft.com>, 
	CIFS <linux-cifs@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

applied updated patch from Paulo which should address this

On Thu, Jan 16, 2025 at 4:00=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the cifs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> In file included from fs/smb/client/dns_resolve.h:15,
>                  from fs/smb/client/dns_resolve.c:18:
> fs/smb/client/cifsproto.h:32:28: warning: 'struct TCP_Server_Info' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
>    32 | extern int smb_send(struct TCP_Server_Info *, struct smb_hdr *,
>       |                            ^~~~~~~~~~~~~~~
> fs/smb/client/cifsproto.h:79:45: warning: 'struct cifs_tcon' declared ins=
ide parameter list will not be visible outside of this definition or declar=
ation
>    79 |                                      struct cifs_tcon *tcon,
>       |                                             ^~~~~~~~~
> (and many more like this)
>
> Caused by commit
>
>   42b78fe1919b ("smb: client: provide dns_resolve_{unc,name} helpers")
>
> Looks like a missing include.
>
> I have used the cifs tree from next-20250116 for today.
>
> --
> Cheers,
> Stephen Rothwell



--=20
Thanks,

Steve

