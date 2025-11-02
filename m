Return-Path: <linux-next+bounces-8788-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD794C296DB
	for <lists+linux-next@lfdr.de>; Sun, 02 Nov 2025 22:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31CB0188D55E
	for <lists+linux-next@lfdr.de>; Sun,  2 Nov 2025 21:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCEA36BFCE;
	Sun,  2 Nov 2025 21:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="Eut7XUSP"
X-Original-To: linux-next@vger.kernel.org
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3CEB663;
	Sun,  2 Nov 2025 21:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762117268; cv=none; b=j9rwnjQZYTEsZMhuIucdpkcule4wA62Uo+UxEZoAyMn2ZaMVbSDcx7jUc51VzPho3dYCcVX/J9WdO3MDLiJy3tD/NHMvUHcGRnLlKrNOczxDsHUCeqhGVOuKafs1OMTFxck3vTxbW/smvVJTql7XOi67OF1/t/Jv1BDwh/l4QI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762117268; c=relaxed/simple;
	bh=9If7P6rr6ZcYkCouZ5kD7FIoSeKYAMJ4TWjXqVh1fUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5IAcNeqoZ32EwE7K9droqKouw1AG/PYC1uPkUkxZSHtsYOK6SipmBcCF5WGX+bB9xBO4NQBJ7CVqUw4IRON4jOHBndaOIcEnIGM2Xb+BMaMgpFP/hteYqt0l1wIo9+qRrttZcFRVAPv0sQ6XPInpXtgmTugDFgcpibqspJ0m1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=Eut7XUSP; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1762117264; bh=G9ad9bYwFIO+7fmpnUvwtWdo1BM9pd+4lFNMDRP5uZY=;
	h=From:Message-ID:From;
	b=Eut7XUSPREsJXne/Wu/54TNYWOZpQom9nWpR2LBfSTLGYVHOjIG3w9FMvoBGHvoly
	 I8HPB2KeN546hukCg5fKszoDncMSXXDG5h21N4JcRQiMEtV+D3BxqJx60QjAuGmcXT
	 w6Q9Vc0HYflRQ1FQ33U6vyMgThF/BQ2+I1zE91ro=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 2FA10C0701;
	Sun, 02 Nov 2025 22:01:04 +0100 (CET)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 5A2L13tp027560;
	Sun, 2 Nov 2025 22:01:03 +0100
Date: Sun, 2 Nov 2025 22:01:03 +0100
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the nolibc tree
Message-ID: <20251102210103.GA27557@1wt.eu>
References: <20251103075200.7961a782@canb.auug.org.au>
 <20251102205735.GA27552@1wt.eu>
 <a4385fcf-f794-4d2f-928d-5eeca839cb3c@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4385fcf-f794-4d2f-928d-5eeca839cb3c@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Nov 02, 2025 at 09:59:15PM +0100, Thomas Weißschuh  wrote:
> Nov 2, 2025 21:57:37 Willy Tarreau <w@1wt.eu>:
> 
> > On Mon, Nov 03, 2025 at 07:52:00AM +1100, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Commit
> >>
> >>   926b414bee07 ("tools/nolibc: clean up outdated comments in generic arch.h")
> >>
> >> is missing a Signed-off-by from its author.
> >
> > Oops, sorry for this, you're right! Thomas, I can prepend my s-o-b and
> > push-force it if that's fine by you.
> 
> Works for me. Although in this case you should probably drop my Signed-off-by and replace it with an Acked-by.

Fine as well. Thanks!
Willy

