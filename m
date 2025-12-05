Return-Path: <linux-next+bounces-9354-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E777ECA600E
	for <lists+linux-next@lfdr.de>; Fri, 05 Dec 2025 04:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FB9F30153AD
	for <lists+linux-next@lfdr.de>; Fri,  5 Dec 2025 03:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C516F269CE6;
	Fri,  5 Dec 2025 03:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3a/n3wJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C0A221FCF
	for <linux-next@vger.kernel.org>; Fri,  5 Dec 2025 03:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764905210; cv=none; b=d/18yMc+++OGClpequFqO/88f3jHdCYyleXD4s0/t9Xp00AnpMpITU6sKvSdzYhZfTkaIs/Qj1SGM4laSV/RfGaXFFK9WtVBkB1b9ZS1PDiUQLx9CNhIr0mZGosUSlj9Tk0jhqzfbDPRMMPH938cZuomcF/P4YsxVKYltwpNVd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764905210; c=relaxed/simple;
	bh=7sqEYBl5OwSigQFytOOFh6Rw1vI2i/CRGiWdPEbY2ZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGXgSiq0UFlvt+M4lsniNY1/NKcpfMcZ8UwY7Kg8q7O5ZDEcH2dc7wiSXid9n854VYIOV3qHKbNHJiu5T+xhjCKI9ARHzJGqjOt36SUW1FQHRgX5mylGLMMwHjKaI02ize5FzdAxF0e9b/6MOLOogbGRFriI6G1+jLETDmtveiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3a/n3wJ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b9a2e3c4afcso152744a12.1
        for <linux-next@vger.kernel.org>; Thu, 04 Dec 2025 19:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764905208; x=1765510008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sqEYBl5OwSigQFytOOFh6Rw1vI2i/CRGiWdPEbY2ZA=;
        b=R3a/n3wJDcM2+z5O10lhYNpBojtd0oXgvRHrtgRWspj99UoMG7MzwUfSY7BQkLJETt
         ACrFh//nZSqGPL9snkvw+em0BZlOqQNhodJf3KtQqxv1FOGx/vLmzgJ/yIVLjNOlXPLV
         WC3wEdlfAmSZFPUqjlMdTwigOabT2foQqHOIHBq1ogmNxQBAy/CaTqJlbbPFt6pZeeqg
         zF5Tq/dNpDSIlb5KLs/1ydjHk4m2AJa1OzZSaeXghtAu41CwcZaczEfDxyDDo6q1ilZa
         ZLtVjFJPixWsiKK6GhOM3AXE18i4Uy5GUhqyKvUnJC5PsMtHyTb6Mj6VWRIVpMRvP1nS
         48gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764905208; x=1765510008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7sqEYBl5OwSigQFytOOFh6Rw1vI2i/CRGiWdPEbY2ZA=;
        b=cVIrCKLdQNPnUA5knfDNnJn4KmxSjvZo4EchrOVmU0YSOmuPaV/UWh75ws8iHoFfqS
         NtF3TUI1N6MbUZnFnDMlPaR45K3zVqQGdTGA1F4uxHaL24o+wMAplyuUAqi46Gs1HYUC
         9hLcBu8jAk6uwD7Ljmd4KixAz6M8pTfvYx4htnL0PX/T5bezPmbWkV056ie+fn5xBQL9
         ho5qkv4Yjfpv0MKugOhdBUb35660gkxFP2j22oePfqA5JQzcAYVg+R8shmdh0IjqVhcp
         4fwOM535DZTAwyUuSmYgZbqaSrETewgUh7s69bSZhFG+YcmdXzWtIhK2JI5xSZ9vcDkl
         2P+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUX6rjZfSPnqlIUILNHs8I7MYQbp1XjdRo9TB4R3hxiQ57vkHBfRht1XkdNYPQDqCjJhEqDRlIt6qA@vger.kernel.org
X-Gm-Message-State: AOJu0YwQOgIAdO0qUKTxNr9bD16Cpts39YFXrKLc8ATq7Fl0gIdf+8jp
	0c3JT3AH3cy4yUnmp3VabbQZ1mFG7jv3F9rWqsMOG3FgzfcTCuxWJY0glo0Lok+n+I2uPmaEjsT
	0Js6/H23yKVNMkIBbcrk1ALFq/U9tHnE=
X-Gm-Gg: ASbGncsI04le2W7sqI9/4SyE99kjIqrwi5TI4FB6RDXE1XDDA0/guY57VLD3MriFOgS
	M1YqxlfxQ62kFU+pqrRvSI5HVDimQ3zSptRKkUWEXvuLOk7H1ycKgx8ltHQuHNaePEXRvKwZu5b
	qViXIzRkL7Svz0rgjmzXAOXEx/LjHB0nvVFRn3/54LYIDyzaL2zrpyHOXPDE8l6947Wr8EKSw9n
	EUQJCWO9vG27FbWqOPpR1aSJYxdhfMHcBXRzSDrwUn8B+BFx1T3eTiff+JhbjAtSKT7sdPi3KK6
	/8ssuM4YCr7Hzj9NUcmonikBcvffY4NmvESc39dWdaB5FoOmDLhoCuB1L4cLR0MrKnMrPSMExta
	LOcD0QOdYddJgbA==
X-Google-Smtp-Source: AGHT+IFU4F1G2MKunwpFkfDWbRwNovZKSEKl1MTEY6OPDxaIauU7cNCjSVN1Ev/qzaSl+ElyQ2UNhuKsvzwkoUGgpGs=
X-Received: by 2002:a05:7301:e0d:b0:2a4:3593:5fc8 with SMTP id
 5a478bee46e88-2ab97ca970amr3589283eec.2.1764905208475; Thu, 04 Dec 2025
 19:26:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205142031.7404c49d@canb.auug.org.au>
In-Reply-To: <20251205142031.7404c49d@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Dec 2025 04:26:36 +0100
X-Gm-Features: AWmQ_bm-CwrcfQF2CzSHGLQfSjHTHHpL1TpOBk4HM-i2_Yh99QFC_gxKoooaBvM
Message-ID: <CANiq72kZ-sHRmzOeiPh6gAk8mEfsSWN0N9PyY=Th2Yd9+ratdA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the driver-core tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 4:20=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> I fixed it up (see below) and can carry the fix as necessary. This

Missing diff?

Thanks Stephen!

Cheers,
Miguel

