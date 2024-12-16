Return-Path: <linux-next+bounces-4967-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 380A79F2E28
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 11:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B52BC1882FBA
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 10:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F041D2036E4;
	Mon, 16 Dec 2024 10:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QukmelGo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7494FBA49;
	Mon, 16 Dec 2024 10:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734344881; cv=none; b=PiOVXFGgwfekwPy08SW7NzWlCTJe4HxqfEGWktdeS4pFVMGppG8YuBL0o8xWxTsT7ve1O4/hk1YVER06N6cT4PQuE4mSn8EkLaMgeSPsyHRxJBi8qqM2i88GzIqgrdBsEUKH0M0xszfiKbuZloqmVV7fCZY81bxS1wh59JODzVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734344881; c=relaxed/simple;
	bh=M4j22TJEC3Q5qHgWVqSXPrrjmxXJPGpHMPKo7wQxLcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EgIV1Qec91h+80si+i936Diz5W+48yXeGLGhZGN7UAMju9v8T7AzmiJg/9mn0TduW1omDLOMSCK7VQfRhveZe8lfsnUWcCtnS/4ojLU3vyxcXR2BjeUPLQ8Bz7ct8vOKPz5QQS9U+cwfSynXHjKsqYhWbOcCJiajEmyyVGaPqyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QukmelGo; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ef05d0ef18so719036a91.0;
        Mon, 16 Dec 2024 02:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734344879; x=1734949679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4j22TJEC3Q5qHgWVqSXPrrjmxXJPGpHMPKo7wQxLcU=;
        b=QukmelGo0aJu+4ePs5QmZs/A2J2YW9Rh8O6M0Rw5x1XczYC1g/20D800CLoc/OtWft
         VzSzWGbSwKNku/Fe9JSKI8PSupL9KRyk8zaYvATbt+bigHmOKuP1Keudw4Kr3SHjdk2J
         eEa5TBSseEihGk2k3xtiKYXI92lgE5KVpm11+WUrrtDQnvlt4vVgzpRpO3nLDMItIlyt
         NpsnCptlk9O08FC95wYk3S1jwLbESlhx2fxenYJeopEpLuIbliKRBMlUcmLN4N7m31vm
         WNnn8B2TdGLH3i+PDInYNkImTCqodukA/xrkSB/TU9yBAnpGsR0g/bfW3Xr/o0ghVAAe
         yxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734344879; x=1734949679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4j22TJEC3Q5qHgWVqSXPrrjmxXJPGpHMPKo7wQxLcU=;
        b=djp8vusxm4Zn0kKGry/prosI9MolJwXhm+ZtjoM653KLYFy6iIhEGQ7Ok+Hg9LS7nI
         B+M4qkz1O4SiYFrisJIMbp5YEslggUuj1uyPo2f+72x0pUyJKooUrA9znK7viwpD8kUh
         K9opFcZBPmMzmVzqMA2/dDekjuYtTMS7avmd0xG4lGoZJrMqSOtbfY8Co44+McY/m32l
         vVkmwiscMW9rX57owFC/F6urA2nwB/m/AEC+FxLM47gkC3At8CGJ8lVAxH6wdqrd1DGu
         Lo5Do+wupcfEv/zE8QpF8PgZMy3bF++BHVfsWww0HKge4yH8AU1hz2G4a8cOVSs9uRR9
         YJIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+u5F9JbrPoofiMKT/jDBS/jPz1miLI0PlLISFz8Tafe9WVEUNwEGKmLFIZHrbuGIi5ON89ojwbwcUYw==@vger.kernel.org, AJvYcCXQPfKr8DjMoIM0UVIUs1cHu/3vMo+x7jOk9VRDWMoiL3vx8dNIx52paZX9SHuwhCcH6fwp+nf+PA9zaFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLAjdXNj3RwI02aWw7bhwy/9e9iD3lUsTNx0WX7afKPRLaxMYP
	YkuSr9xhCeD/4jERAZD74EiwMZl28Vlocxw5I0K6wWZ253wrv/JmP0pv28HbqOVVCgc5ukOFhYO
	CgyXydwlj8+KJPbNZCPVBcBPJfq4=
X-Gm-Gg: ASbGncuPVuqOLvOZUbRMcwrSv1r40Hd87vGlHbHhE2koJ5e+jEUA/q3EWmorJ4/OFC5
	Y40NR1vD1cFsY4kfeCe5XQuzQ6U2NlwyaJWuMww==
X-Google-Smtp-Source: AGHT+IF6U0plThuOcH/QBB7CA/UJLMnPHcO7e366k2Fdx5ZFHRSmtOTqkqexG2cpWMAMdSCktIb5Jrqul1lBQBuvOqw=
X-Received: by 2002:a17:90b:5107:b0:2ee:948b:72d3 with SMTP id
 98e67ed59e1d1-2f28fa55570mr6574515a91.1.1734344878719; Mon, 16 Dec 2024
 02:27:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216153535.23d51bb8@canb.auug.org.au>
In-Reply-To: <20241216153535.23d51bb8@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Dec 2024 11:27:46 +0100
Message-ID: <CANiq72nbxNUCbVEO7_bg6zFQWyMQPwCUJUoq=BKhhE5=u5gryA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the security tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	Alice Ryhl <aliceryhl@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 5:35=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I fixed it up (I just used the former) and can carry the fix as

That is indeed the correct resolution, thanks!

Cheers,
Miguel

