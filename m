Return-Path: <linux-next+bounces-5834-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE38A65E17
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 20:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C4B87AB676
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 19:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575B8F9DA;
	Mon, 17 Mar 2025 19:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xefcupzg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FE71C6FF7;
	Mon, 17 Mar 2025 19:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742240230; cv=none; b=nh9rKC7ObEF5P0QULnMF3Vo7aqnH8q3gFJXxFYsMSCXjzhkzQMxhXRUPl4GvDCNohwflGvIG10akjWRZkERdaQSazrR58N4rdV5GjIzz3L6D/oGSjGgE730MVlwaQFj9c6V5RL6MOMsPXUHX2w0u+YSWdVz5pyvU4fgArB6iBhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742240230; c=relaxed/simple;
	bh=IhOfzCJW0lr4d+ZTo4lNAcF72spMyrUcS9M4r7b7h08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INuhOTPPJYT89lBs4bS/yJGoNnAe50sqssQK39+m8a2HrWZsP+macXIrxbwYYEcUVOo/r9XBNNM3ON47ocBigMz2HSGPdW2hqtbNKWj1HjyOriPmnpl+UGBCR0C1C7bj8EEogfQtKEgSq1R/5SnUjTxS9c/3hSwy4LHwUDEVuxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xefcupzg; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff66327419so740334a91.1;
        Mon, 17 Mar 2025 12:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742240228; x=1742845028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7L8Pc0ZJC04xtdBJZUgSKgU4czHgchJEq5tzhngDMs=;
        b=Xefcupzg/eUcZ367hXK7gzxHYBat78F+n91imVG3Jt8NaIW5mKqlIAM4pQDONaTH5p
         1rZMoKPlVXHbPFrAdpVllzYfTy82JBr5TOGsfzBuCC+BPAK8FGWQVbTVNTeYE9Twkox9
         0o5CaJZJng3gZ5y7JFnxyhGNYtregmNMHJsHgmOiNhMrD2tkmmawWRPk5wyrmHiGwOBE
         FAtRC4fvMcWPMUOoBaXMhTx0qNY39+K5Ftt48c/+Gc2gIXRyoG/SHgaIsuN4Vksc6jU/
         Ze8ygTh0IjW+BSDtgKUeijQaSpU2j9507aNianv6y033tEcNvwifaZBY9Xn1iDMh3HrV
         auFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742240228; x=1742845028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7L8Pc0ZJC04xtdBJZUgSKgU4czHgchJEq5tzhngDMs=;
        b=q8ZsDQsg0GsK0GU3r3YaRTMyzgfilVTiCSE6dkvsouFjqNl7wXHxlCge+0blWDMWes
         am4lTQoyetNDlKZVCcbgW2RlFN46iO34nBWNJfcTsA3VkEZqXC68sZUEFa5A708JNxdG
         eyT6WWoC5vnCy1TxiU6UW7yZmb3lMeNSt37cyRYe9qilFXJqvbKdC2Zbjtsx39PDgkD0
         BmCwRY/aQFOOwSE30ORhXTC2Qde12mcA31i9GE3YfwaZ3fe3wluVxhDAdvckgIROoDt6
         1MeRuuJWSGbg3UZ2+eVDIXL63GECnaSnqxAUBsix1vz9FbzKnsF030kswqVECAaZivfG
         RNfg==
X-Forwarded-Encrypted: i=1; AJvYcCX0IrUPVye2dvtnHVZ1ulbV7aJnEzK7GHnozJauU8FRHoiCA0RZm/e1fcgbYYPfVkWVqJL7oMhTbCYEliM=@vger.kernel.org, AJvYcCXfHDksFF+xXk1uuy1wnPWlLixZDlJEO4fZVuo9n3j5GIYGFxEaxRTMPDrAILdqMxtCm6gsHqAQRhMGqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyYM+lax/i5VJbbHIqlnOVSdO57O4BHuWRprORCQoYVR4wmJtv
	/7Qyc12XTHOkfI9d1IyvukYTwaiuUU7MdZYFtL49zt5N6dtL8yfFh79X5UWacTRLKvWPywVIoZM
	yKXBvczc47kB1doLCtQ9H99iGag4=
X-Gm-Gg: ASbGnct2NZHprbEvRzaZs5rYrM/qwqTtBaPBY5C0EvFLEHC0r3U9DUHyK3DxFcdheN6
	WVBAfMUqijYFfDpqRlkxELARFa79S2Ub5fYmjYcTT60YQdxS3w9AZ4sT5zt/gV1AX9EB+tSVYFw
	MhDTQsXp6k2Qfdw5ldxTV1C/Cerg==
X-Google-Smtp-Source: AGHT+IG9fMPJIqrlA5pknJfz4cpUvvxRHq2k4QViRsgYEqx7zv+6sr+mitnXlvNttwx8wT6uZ65CQFaF3a24DBG0y+E=
X-Received: by 2002:a17:90b:1b0f:b0:2fe:7f51:d2ec with SMTP id
 98e67ed59e1d1-30151ae0dbamr6578837a91.0.1742240228025; Mon, 17 Mar 2025
 12:37:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317210518.01aad634@canb.auug.org.au>
In-Reply-To: <20250317210518.01aad634@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Mar 2025 20:36:54 +0100
X-Gm-Features: AQ5f1JoITGFtSii0FTyopkumTjqykirvam3Xg3Y1_kQDpGhEjDe03RdZBv4nQR8
Message-ID: <CANiq72kDZDsVLraCe9n6kUGKC6BT1825Y4ejhEiLg11B5hOQBg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <benno.lossin@proton.me>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 11:05=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   scripts/generate_rust_analyzer.py
>
> between commits:
>
>   d1f928052439 ("scripts: generate_rust_analyzer: add missing include_dir=
s")
>   a1eb95d6b5f4 ("scripts: generate_rust_analyzer: add uapi crate")
>
> from Linus' tree and commits:
>
>   d7659acca7a3 ("rust: add pin-init crate build infrastructure")
>   dbd5058ba60c ("rust: make pin-init its own crate")
>
> from the rust tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Almost good -- there is a missing "pin_init" in the dependencies for
`kernel`, and I think we can put the new crates on top. Please see the
resolution in the last message.

Cheers,
Miguel

