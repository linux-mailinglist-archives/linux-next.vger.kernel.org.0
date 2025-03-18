Return-Path: <linux-next+bounces-5863-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0682CA67823
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 16:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90E9C1883819
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 15:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020A320F065;
	Tue, 18 Mar 2025 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="tUJxnqu8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C426720B80C
	for <linux-next@vger.kernel.org>; Tue, 18 Mar 2025 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742312549; cv=none; b=Y+dD+2Wgvf+xfJUBiD+Ffg/gubzBr1OoUmg+pCEut/OoT3FZwIB6z6drvLoqnO3JnRLs6dKUTS3WuXlQl/22b1PjTTe5gnmccPC7ZhyeaJemzuKN7iWh18rDvD90Wac0RZ+6gNCi/0fB8RS5RC4q8l7epq+CUpcYzVE64QLcq0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742312549; c=relaxed/simple;
	bh=Hwdtp4nHusm0bzMZH2sjJxFzaX4iEMDSAD2WQE8AUow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ne7ucglr1JJRtNpvnZeIG/hALW/q9HdrFDYEwqxfmxbuhOWx2zYjvDbqtcRmpKqSoHSn4W80zN58Xsh8b6eOiuoK9Bg/ZwWnoS4wshQ8YAVEG01GqjLb4r2OHPz9H9s+ERE+mSh7OzXb4i4KQmW/dbz3ZLdcRpY0sRXuzIzMJA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com; spf=pass smtp.mailfrom=omnibond.com; dkim=pass (2048-bit key) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b=tUJxnqu8; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omnibond.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d571ac3d7eso5590105ab.2
        for <linux-next@vger.kernel.org>; Tue, 18 Mar 2025 08:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20230601.gappssmtp.com; s=20230601; t=1742312547; x=1742917347; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhhBaUByL11Eg/L/aJ0UGIONk2f7UqBYF49j1/2iJBc=;
        b=tUJxnqu8S0+oEDg6jzoJrNoRRn9bstd1RHp0l+lDmdoYKRBxqWFOm9RoLIGMtlmEkG
         7W1tYwXt7IbjuFgUw0I4KpBWZQOt3QfZqxF/SlpB3qMp7iAP3ENrgBNYRZ+INnIasbiB
         AMhw/ulidChlErQzuqcghPHF45oahhb7LYz7aooAMlZ9HJjl9rtL2BVLUAzxULtpt8OH
         Ypx0aHoMFVnzillnrIc1gbRLwobSGlFGCHxrzL63MhFelgapc+eL9k6sKgY7dzuutela
         YlyCuljIzmatLNCnTkHTGfiQ8E5RWg9kcoKDNuOB7riTa14NPdoZE7rUuGIL1OIHFqY/
         tSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742312547; x=1742917347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhhBaUByL11Eg/L/aJ0UGIONk2f7UqBYF49j1/2iJBc=;
        b=MoL3wvrtNTkqRtn/c2Fgufa6K9kubP8hghYJqqBx/9J1JxA59hpgTMYYE16QChWzd9
         29Vldx4oIeRrJZp87xPELRhG5dPnhX+L5XjSyLyuUOWP4n5was9mwkj0Kczhg2KONcgR
         qTM4BDxVAAvh7lJLgvwANHBHvC2OntvCkHZoDj5yDqkUa0rBWJr61cWxt6iZ0Pq58Z8g
         /qNRgJHhaRZiGpJCENMlpZhJzcbLBzv+DcPq4UqYc2jabn0MEQSzxLF4S+P8gGd1f7h4
         yMJk0/2COSCMlQl/Do7N4KePbmrxCeLTVhVo4XIjI/kYF22QDRMq6e9yDBDYy5C3Jc+F
         m50w==
X-Forwarded-Encrypted: i=1; AJvYcCUOLD2anP1Gi6iEdErZPsBelGdohHJn2nQpUxOARpMMm25TxMu6x15zCq9U+vSXD85elf4kyAvHG21W@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs/wTG7Bb/I7q4X3WTXMCaKpCDJN6PjX3EUHAcxsj0ZLkVy68J
	zzcjBi1pAKAsvYiwXp+KCowOhCDXgMNQgITxGiR3Xl7W3Owa78/DIvK2nzHzDaLLm8KEt7aY1b3
	beNkunMcZPxXl3jDd0cEvDfxTbr1lwBIU+TUb
X-Gm-Gg: ASbGncsfNzVf6sLt6Po8H2h8CH5YX8XZTOBs4iOfcpbsERGxiKjh8Fa1gbjplpPp32r
	xQrrB6wi/odlj+0ykGT9kgElL4cesNg5uneS68naYaj8SX6uE118eRLSn4WhEKaP5Qx04ndv3Ne
	af8Xp2BW+J2zOeZNWb3RoinIYQo1flIKjht+e/6wzOYv4b/pLR
X-Google-Smtp-Source: AGHT+IFxnYvCAuvPU42m6/QC1ywQA85OXr0FTCGOwuudEBHkzLK3cxIzbtf8pL2zy7+O30GTiOC2JUsE+fj6fWoxR44=
X-Received: by 2002:a05:6e02:198b:b0:3d3:e2a1:1f23 with SMTP id
 e9e14a558f8ab-3d483a75f20mr199628305ab.20.1742312546859; Tue, 18 Mar 2025
 08:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318101256.01afbb47@canb.auug.org.au> <CAOg9mSTNLVWjqU4DnHFhBjAfJ7Do_Lfj1Oxe0cn55TBb-hYPwA@mail.gmail.com>
 <09c18763-7a60-4eea-b77b-85260b8b6b02@app.fastmail.com>
In-Reply-To: <09c18763-7a60-4eea-b77b-85260b8b6b02@app.fastmail.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 18 Mar 2025 11:42:15 -0400
X-Gm-Features: AQ5f1JrPIfXgu_k4Po3vsh9qy_T5bnnvC4odhum41Kh6EH0sFSxEyeqjpkgtViw
Message-ID: <CAOg9mSRB05JSF9nfruWov+Os8tfXE8KyE4GVk5Pgp3pnA-4jow@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christian Brauner <brauner@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, 
	Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Arnd... thanks, I'll get 'er done...

-Mike

On Tue, Mar 18, 2025 at 11:38=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Tue, Mar 18, 2025, at 16:24, Mike Marshall wrote:
> > Hi Stephen... is there something I should do differently? I might be
> > using an older
> > version of the patch, it was sent to me around three weeks ago.
> >
> >>>Caused by commit
> >  >> 50fb0a7f43c0 ("orangefs: Move s_kmod_keyword_mask_map to
> > orangefs-debugfs.c")
> >>>merging badly with commit
> >  >> 063f8013373a ("orangefs: move s_kmod_keyword_mask_map[] into debugf=
s.c")
> >
> > One has "Move" the one I'm using has "move", as if the author (Arnd)
> > made an update
> > to the patch and maybe I missed it...?
>
> The earlier patch was from Matthew Wilcox. Our two patches are
> almost identical (they add the same data in different parts of the
> file) but sent independently, and the problem was that both got
> applied instead of just one. I think the easiest fix would be
> if you just drop my patch from your tree.
>
>      Arnd

