Return-Path: <linux-next+bounces-4721-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0329C2E9C
	for <lists+linux-next@lfdr.de>; Sat,  9 Nov 2024 17:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A89D1C20FE5
	for <lists+linux-next@lfdr.de>; Sat,  9 Nov 2024 16:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1826D19D06A;
	Sat,  9 Nov 2024 16:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIZZpkuz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1DD1537C9;
	Sat,  9 Nov 2024 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731171438; cv=none; b=qDJUZBu4ifp8bRclkgiT47aVTOmW49UTlH0D9Rn88z8ywuGXe2Kp6pD1KDd0sB1GTiIHWhVpv6MUfMzpflBkRmyb+nOEWupTAHD6BkYUpeBFBmXYHPhuuWiftR6b8tZDHoUbaYm0T4HelcNwUEIfS02uDCNrfMuX2wqx8B/umbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731171438; c=relaxed/simple;
	bh=i8hJauaqwslaETLhFqoPJLuS8NN37Zi9IGkHx7X2Qts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PMejx0lsyp9TTqqWNzlAKQJNMTXApT6gtTNcuBFrBkelIT9u56ex03T7ldu57yH7uBYP3XmU/Lnol7mQvPoAiboQ6sG1PsOD+nwItSyoFd4W6XumIKUSj0luU/i41JELdPhw8HLksFcI3SP6L/nxdlVHoZZfK7mv/+0DPJiEg6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIZZpkuz; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e9b23d189cso277515a91.1;
        Sat, 09 Nov 2024 08:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731171436; x=1731776236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cj1AR0EvHQpu6WLpeb68qCEphyV98dcCcf5SQEQfjPo=;
        b=JIZZpkuzbYcknwwJoGZQHiiWbd8mOceVYXbQMtf/JbPm/zk5zIaJLrj3+lJng/XyM2
         ggdthujfczOZ+gjAfRCbDUePc50pys3Lyzxe3Ac1r/OPUJ0ECnDwUg77zr7EOTQ6QKPo
         UuR8x9EiRza4JkuRBGrChC3viBQTV2YKADdWQXhGjw0z+cCt80GJIqDpXYYzfWOCz52F
         pQP9lS9ieOZyqwOKaui21uHkuiD1R2MvE7274Clt4BFrPZMnjx+WgBWA7HoaQYa8Ghyd
         D1ZLSgX7E6RBBBZJXUHWYYWEaxt7e2jXB03TpECZCKrUWKthvpDtTBXwrhOe+rjDE3OA
         HYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731171436; x=1731776236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cj1AR0EvHQpu6WLpeb68qCEphyV98dcCcf5SQEQfjPo=;
        b=sPJZVTR0Q2PZd5LCggcQkhTk+Vzahdkj1BkYUcyMgFvYsQAuSj8QR7PZcfPHll8Tg3
         ggX9k6MGSXz/IbzvyWG6ttkwrQ4SB9pcfK+jy0QTmeDQZIBo0FEYQRmCGwLBK7c5Tz3X
         7E4MjB7H2iboK32i1XTjkyBgUfeJENE3hHBXjUYVJ3oG8LbGbPfaEbDODDNkfOH4pK52
         pa0/v/BnxyGlPHlPbePwpB3eE8UikCagsXP/qQmQExugHUYjcj+PUrQmtltazHaiL2/O
         lEcGGdexnLpMPgsxR+57jttqDdofRtEwfHekz6xKPYN36qNKNt39hlKo7XGaFqI6G3th
         1Lkg==
X-Forwarded-Encrypted: i=1; AJvYcCUFnIDvifU9wg0cozWxbmUEhVlCKszC6lArG/mUVBm8G2LtMp42S+bwpULd98jwGs4k0LF2abTwH4bPmokbR0o=@vger.kernel.org, AJvYcCVGPgj6xm2RIM+r9RT0eN1hs/pHk9bX+jKGTlqDby2l3tHJ7iOklDE2VakKdZAd4o6xYp6GL6w58IIHWg==@vger.kernel.org, AJvYcCVi5+XNoVA3H3VI7iPWECQvTf5DCUlBeGq/Z8DB3Pwz7KUXTQRD3jn20uGLEUonocBl1Jzz9qY5pSVfH1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ58n2kQVF6xuOpgYVg9Od51VNmSniPuH5nZrJwb2kPPYEa4Xf
	qVAzu4/uFntJYwFw3sAMi23MIo70b8LE0nVlhB9bORNcx03EJ9h+dPjDDGe8f4Du0dBsabSNlwc
	duNV1d8E4RfTcgFaz0AK7zgHqQI0=
X-Google-Smtp-Source: AGHT+IGtd5uAVGyMbPZCbrXoZEoRrNhuAunugHzuvwexEnuTm7+n+0c3DxRLBDx7oIwtQSxXfmIbXwKQUW4wjGxwWIc=
X-Received: by 2002:a17:90b:1a8a:b0:2e2:a60f:289e with SMTP id
 98e67ed59e1d1-2e9b14884dcmr4081654a91.0.1731171435770; Sat, 09 Nov 2024
 08:57:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108152149.28459a72@canb.auug.org.au> <20241108095933.72400ee1@gandalf.local.home>
 <CAH5fLgj6zSDH6Oe3oqfE7F+NQSgSLxh8x7X3ewrrDAdOHOh0YA@mail.gmail.com>
 <20241108153503.1db26d04@gandalf.local.home> <CANiq72mP15rjfR3cMZH-z9hkTDQfqgEaM4M+71B1KWLmw=3cPA@mail.gmail.com>
 <CANiq72m9T7NM33SCw=7yssTXFy=7FvD9zS26ZnBT6RMJB6ze1w@mail.gmail.com>
 <7B5D1CF7-0DBD-4F19-8587-32516DCE233B@goodmis.org> <CANiq72kg2k6cn3J_x+DZVGgSKwVXF_bLHFYsuexPHHg6T7b7BQ@mail.gmail.com>
 <3DC15367-3B1B-4808-988D-8C8D1CB2F4BB@goodmis.org>
In-Reply-To: <3DC15367-3B1B-4808-988D-8C8D1CB2F4BB@goodmis.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 9 Nov 2024 17:57:03 +0100
Message-ID: <CANiq72ki5dR6rzBu5nxA0CRt9RpcbjJmoey82BCPLdxWHtWQLA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the ftrace tree
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Masami Hiramatsu <mhiramat@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 9, 2024 at 2:03=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> No, I'm currently traveling and thought your change just touched what's u=
pstream.  I'll take it.

https://lore.kernel.org/linux-trace-kernel/20241109165520.1461400-1-ojeda@k=
ernel.org/

Cheers,
Miguel

