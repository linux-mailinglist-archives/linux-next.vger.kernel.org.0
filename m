Return-Path: <linux-next+bounces-4778-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 930199C7AA8
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 19:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4694B1F26FB3
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 18:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3EB8204015;
	Wed, 13 Nov 2024 18:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1Szueys"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05F970835;
	Wed, 13 Nov 2024 18:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731521174; cv=none; b=VY0YcZGgxHYsFh14RZWJNZ1/cJYaSf2S2h7f+agtdtsqgdLhw8QmM0ae1dBpLAgxfAN//3QpNwLwy6F0smyTHJ+l4efLAYYMw/UEnbaI91IU5TN3Fvg2CwJZuLNrcmIkcA8wzGxLx8JYG3+XBn4QkWqN23CUJl9+0u7EMzEZ+ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731521174; c=relaxed/simple;
	bh=oHAIzWnC5ZkgphQ6o3DUo9V5Y+LL0DJsge4wegJ6wcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMTQOq6o8CAIPkx7spXhZGdmjyJevXzLrWidXw4gHI3QiZz0DMnFCF+9RYrt43MiC2PAT9gomsw7CG7Hjntb+QHZf0m8FRaQagvjDgGIgLdWedXiscEpk7wgqvDiDXDvUwsdCDGyalgymr+EGKu6VMKpGb3NsLn5Vs6xl1bPbZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1Szueys; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e4c2e36d5so437164b3a.2;
        Wed, 13 Nov 2024 10:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731521172; x=1732125972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oHAIzWnC5ZkgphQ6o3DUo9V5Y+LL0DJsge4wegJ6wcQ=;
        b=T1SzueysGEXRy1aS+6TndsCSzMcii2D+VzGTS1Wgt41Y4AB7dIYD8dDpJGg9wAYvNo
         yI4/tNdrE+SxdViKGq5i4rnYY0acxoEMPunw/8gsdn0NKTe42QHnxvZmDM49Y9XmB/ff
         fXDu1J5Io3lHflLCqOEjLtSlbNqbu3RT0HSSPsInw5BQ3uN4xyIPcIs5RKzxQZ4kRCiP
         ynUMMo1qsYHAWbLiNDlfGXgDW1KtTGHJKiBlbyhLUK/otcpHdICPCRIejAmG6Nhdp7py
         I12HaGkDxd++uE6mXeiA+TOwwPo/uYIoq8E8D2126IjPYLjL0t2asNjcSUw5yB6Rp2Cm
         zzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731521172; x=1732125972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHAIzWnC5ZkgphQ6o3DUo9V5Y+LL0DJsge4wegJ6wcQ=;
        b=ms0JvwfyVzIyC+tozGOiyhEMutiJl+OOIonxxNVS9DYooBp4GtLOk4jjuW2sOIEMIU
         PRq+cjBlNz0rycKvzGEh9MfATRAc7q7Rq6PbC4Pps7vsGkRjBhCPBpkSn8UgMO9w5Hrf
         OqOxzNB3+Np+aGrG8GQ12qwbUR8D2QUgpQpP7BCIOoQBhPy/nzitZz8vwTwk+ULwYuuS
         o/n6skrp8XGH1fb0MVRrWt7kYzzVwU4M/m2mnuw/A5FANyXsSBeuLnA5VZ557a/qCwkB
         BVfDRqRFPqUEenL+cHn2Xn54MPBo/5tDn9f9IvGDS0LrWIFyqmVTuH5Iuqz1jV8Glv9o
         DfBg==
X-Forwarded-Encrypted: i=1; AJvYcCU3DLXqFch4zB57CKuZaFXxIpXtKckEW+Q3DBSIzYUqVYwhbLYxGoMXeiecAinWEPeuEkgFvSvaHk9wxVk=@vger.kernel.org, AJvYcCUZm1UM3iMGFAnFiju+eYCHj51V3vlBa38ebd4BQ5RouiRvoFTcfx43l5tJROIS4Q5NYN6b3AsCJYP6wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ1MWmgjF0A6kcfc/gjtFp3sCRxE7P8AOcehQ612H6orRRvZuy
	nujDM6MyjuUG6kn9aCk8JlK7dR3L3iEMffuigc/MK0hjq/zjRG2tzK6mIS7Uo/Aerp5EBofqQed
	OCJBaUo5nCaZTl8q85GGlVzMXu2c=
X-Google-Smtp-Source: AGHT+IH6iacih9T++ypPHl3skpfjjUR7G3j9x1a8LQUfmYkl/ivs4YWpbXot3YL9lc4ZaiHfclrhn0wRg3ySkgSWsa8=
X-Received: by 2002:a17:90b:4a4e:b0:2e2:d562:6b42 with SMTP id
 98e67ed59e1d1-2e9b14d7d14mr11879257a91.3.1731521172040; Wed, 13 Nov 2024
 10:06:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113171638.5d1343e5@canb.auug.org.au>
In-Reply-To: <20241113171638.5d1343e5@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 Nov 2024 19:05:59 +0100
Message-ID: <CANiq72=bcQuf+zHjw8n0Lh2dcvOm-K93GLvSaaq7UDVkWGT7YA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the ftrace tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Aliet Exposito Garcia <aliet.exposito@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 7:16=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I fixed it up (see below) and can carry the fix as necessary. This

Looks good to me -- thanks!

Cheers,
Miguel

