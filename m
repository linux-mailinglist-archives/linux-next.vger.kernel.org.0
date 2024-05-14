Return-Path: <linux-next+bounces-2299-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C3D8C4D38
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 09:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD810282096
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 07:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B222B1400A;
	Tue, 14 May 2024 07:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4oY5dsM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2453214A8F;
	Tue, 14 May 2024 07:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715672416; cv=none; b=Xc/Sr2G3QiemvPuWbm8J+T3ikXYTHmxhFhxdGS5UrWyS/YydfwVuT9jh3AbTxDWsxPBgYWrAlD2Q9POiDYEZcAylcLYIqQnAvoxV7JTkrdg28gcAemJ/hT1upFJLWJAY+0b3V06iGer3/Ht2n5TyIWkHW32HeR/1aGQR0ofy/v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715672416; c=relaxed/simple;
	bh=wmBYKPZic6o/3k1aA9E1qpLYMrpAVXLd4dEq/ZkqCGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7m6o9xcuMPlTxdlPE4Rx74klUaUwjrNhXdWKSBQUUyCEKpraSpH3/6hCwOZgiwfTttF5Iur+3Wj9YyX7ywx2oDopLdUhID7RedZ0MuzJKQKmuvAkdTk6+/1m6okU0/zWLkkZ4W4ZCCMRh3+pE6xDm8kaFgZ6YLoypWC9iH2Rts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4oY5dsM; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f4302187c0so4288333b3a.1;
        Tue, 14 May 2024 00:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715672414; x=1716277214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3YvLEqN9SF7GsP5Ax2ZZ6G4kMkxSvXwWE7lq39nUwFw=;
        b=M4oY5dsMwocE7dvSdbdbOVgqXrZlKOWItwYbhkBwOcyG9VKS+hQ25Mcc9x5cgiDWNg
         UJH8Dj8y4uJ8VHKrBRKrRee9CK9F1YMUwSdy9rZ5x+ivU/xEKtYHA/k2zhLNfab09qoI
         KLSZy8n5U0LglITz51hCHpFEkHkJLXjmjcbzMz3IdPtkAsmWHM8scOvHSVzLMIOi9vyn
         e6PUcajqwIWZzcGSPOaumnFkh+QcCdqW7cDc4tdfOXSicWOpLIuibrQAyg60/6ygk6FJ
         Fi8Pk0yYf0WwZLU1AAAlIMe2j+ixNk0QWQFPExBMhtpmKgXmzwpgMyZ5L2c/uhho70Da
         PzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715672414; x=1716277214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YvLEqN9SF7GsP5Ax2ZZ6G4kMkxSvXwWE7lq39nUwFw=;
        b=fhC0zxT1N43mRIvvA3FM2QOnlVq97moOby4PxvCvbnq1FRYWVLHmv4uXHd4rW4Hjt6
         LAhzrLrkgrPro6GX35qfZRomCTgwz4Oc9OcCzVaZUIX5BHLyBnDji+JH+Fjevlpvmn5M
         SuMxbaOQTVtSuet6fjU0Mk+YGvr2luqGNIFh/C2bhceaS+B4vHwFmuwqfMhE/EJSjEfU
         97xya0QcxgaHKiexVB+YJIuFHnqcUq0V6bADGLkZQlAkQ7nF3kWogJs2s/QngO9WzKGA
         LlRNH2DTQbZLxAOHY4clbKkUvmBaGucuXBAfhRcj2xPLTevDM3/a76twvJIwc1v51myz
         7gDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZLBrMIVnHkMsN4pQOdRyrQSLx2B1arr3GCbePzuF1UIJDZD+stFjkh/KB0p3qOsvUD0AQRp0DVMnBJw+D/PXC3L8M1fZT7HOi4OtpKpO3BQg4Ta720Ca90zyHOBDXg90rJav2dhjAaQ==
X-Gm-Message-State: AOJu0Yw6Obfh4ScDpI6+ptxOPEpUEI3KtWbNAYxzvI9yEiARIWW6oKvi
	ZXCmaP1jpEsj7p+dNo2bHBIBwD/cPSr31zo8JHAzN3Q4UnPIakuQ
X-Google-Smtp-Source: AGHT+IGNqjEroFEESDPk+9hGlEurdGGZ2qzj8D2ekEtBC4a4gYh2e8R5zHqiPYEoJGR5nX/Za9xXlA==
X-Received: by 2002:a05:6a20:4323:b0:1af:58f8:1190 with SMTP id adf61e73a8af0-1afde0d5a81mr17017732637.12.1715672414235;
        Tue, 14 May 2024 00:40:14 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a81c8csm8501511b3a.70.2024.05.14.00.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 00:40:13 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 1E369183B228E; Tue, 14 May 2024 14:40:10 +0700 (WIB)
Date: Tue, 14 May 2024 14:40:09 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>,
	Matthew Mirvish <matthew@mm12.xyz>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Coly Li <colyli@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the refactor-heap tree with the
 block tree
Message-ID: <ZkMVWeGUb8OSiC4U@archie.me>
References: <20240509152745.08af752f@canb.auug.org.au>
 <te64v6zwwor6jkco6uiu2zz7ern6ijhyu5okfvdz3bmj3w5qfp@mx4zdniwymqj>
 <Zj1RzZdtfL7UQax1@visitorckw-System-Product-Name>
 <buehluxvo234sj7onzl6wwjmuslmnkh7g6vnpru23kpti6qmpp@7nqak2ser7mw>
 <Zj2PX6Fy3BEnQc50@visitorckw-System-Product-Name>
 <20240510034618.GA3161190@mm12.xyz>
 <Zj3kowGa9XzJ0yak@visitorckw-System-Product-Name>
 <Zj/F/yf0ixB/eRX7@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="312VrB8j4PQGMpon"
Content-Disposition: inline
In-Reply-To: <Zj/F/yf0ixB/eRX7@visitorckw-System-Product-Name>


--312VrB8j4PQGMpon
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 12, 2024 at 03:24:47AM +0800, Kuan-Wei Chiu wrote:
> On Fri, May 10, 2024 at 05:11:02PM +0800, Kuan-Wei Chiu wrote:
> > On Thu, May 09, 2024 at 11:46:18PM -0400, Matthew Mirvish wrote:
> > > On Fri, May 10, 2024 at 11:07:11AM +0800, Kuan-Wei Chiu wrote:
> > > > On Thu, May 09, 2024 at 07:16:31PM -0400, Kent Overstreet wrote:
> > > > > On Fri, May 10, 2024 at 06:44:29AM +0800, Kuan-Wei Chiu wrote:
> > > > > > On Thu, May 09, 2024 at 03:58:57PM -0400, Kent Overstreet wrote:
> > > > > > > On Thu, May 09, 2024 at 03:27:45PM +1000, Stephen Rothwell wr=
ote:
> > > > > > > > Hi all,
> > > > > > > >=20
> > > > > > > > Today's linux-next merge of the refactor-heap tree got conf=
licts in:
> > > > > > > >=20
> > > > > > > >   drivers/md/bcache/bset.c
> > > > > > > >   drivers/md/bcache/bset.h
> > > > > > > >   drivers/md/bcache/btree.c
> > > > > > > >   drivers/md/bcache/writeback.c
> > > > > > > >=20
> > > > > > > > between commit:
> > > > > > > >=20
> > > > > > > >   3a861560ccb3 ("bcache: fix variable length array abuse in=
 btree_iter")
> > > > > > > >=20
> > > > > > > > from the block tree and commit:
> > > > > > > >=20
> > > > > > > >   afa5721abaaa ("bcache: Remove heap-related macros and swi=
tch to generic min_heap")
> > > > > > > >=20
> > > > > > > > from the refactor-heap tree.
> > > > > > > >=20
> > > > > > > > Ok, these conflicts are too extensive, so I am dropping the=
 refactor-heap
> > > > > > > > tree for today.  I suggest you all get together and sort so=
mething out.
> > > > > > >=20
> > > > > > > Coli and Kuan, you guys will need to get this sorted out quic=
k if we
> > > > > > > want refactor-heap to make the merge window
> > > > > >=20
> > > > > > Hi Coli and Kent,
> > > > > >=20
> > > > > > If I understand correctly, the reported bug is because we attem=
pted to
> > > > > > point (heap)->data to a dynamically allocated memory , but at t=
hat time
> > > > > > (heap)->data was not a regular pointer but a fixed size array w=
ith a
> > > > > > length of MAX_BSETS.
> > > > > >=20
> > > > > > In my refactor heap patch series, I introduced a preallocated a=
rray and
> > > > > > decided in min_heap_init() whether the data pointer should poin=
t to an
> > > > > > incoming pointer or to the preallocated array. Therefore, I am
> > > > > > wondering if my patch might have unintentionally fixed this bug?
> > > > > >=20
> > > > > > I am unsure how to reproduce the reported issue. Could you assi=
st me in
> > > > > > verifying whether my assumption is correct?
> > > > >=20
> > > > > This is a merge conflict, not a runtime. Can you rebase onto Coli=
's
> > > > > tree? We'll have to retest.
> > > >=20
> > > > Oh, sorry for the misunderstanding I caused. When I mentioned "bug"=
 [1]
> > > > earlier, I was referring to the bug addressed in
> > > > 3a861560ccb3 ("bcache: fix variable length array abuse in btree_ite=
r"),
> > > > not a merge conflict.
> > > >=20
> > > > Here are the results after the rebase:
> > > > https://github.com/visitorckw/linux.git refactor-heap
> > > >=20
> > > > [1]: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2039368
> > >=20
> > > The ubuntu kernels build with UBSAN now, and the bug reported is just=
 a
> > > UBSAN warning. The original implementation's iterator has a fixed size
> > > sets array that is indexed out of bounds when the iterator is allocat=
ed
> > > on the heap with more space -- the patch restructures it a bit to hav=
e a
> > > single iterator type with a flexible array and then a larger "stack"
> > > type which embeds the iterator along with the preallocated region.
> > >=20
> > > I took a brief look at the refactor-heap branch but I'm not entirely
> > > sure what's going on with the new min heaps: in the one place where t=
he
> > > larger iterators are used (in bch_btree_node_read_done) it doesn't lo=
ok
> > > like the heap is ever initialized (perhaps since the old iter_init
> > > wasn't used here because of the special case it got missed in the
> > > refactor?) With the new heaps it should be fairly easy to fix though;
> > > just change the fill_iter mempool to be allocating only the minheap d=
ata
> > > arrays and setup iter->heap.data properly with that instead.
> >=20
> > Thank you, Matthew.
> > Not initializing the heap's data pointer was indeed my mistake.
> > Following your advice, I made the following modifications to the code
> > on the refactor-heap branch in my github repo. I hope this time it
> > works well.
> >
> Should I resend it as a patch series?

Go ahead.

--=20
An old man doll... just what I always wanted! - Clara

--312VrB8j4PQGMpon
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZkMVVAAKCRD2uYlJVVFO
o4xpAQDcKGhTrKxpV8NOk9uCQIEYfiixEwNAetO//zNDgyWC3wD/SacWmXhwC6uq
YKUG0mVu0I+GIuX7vPUQfOQsSAyfZQ8=
=vAUY
-----END PGP SIGNATURE-----

--312VrB8j4PQGMpon--

