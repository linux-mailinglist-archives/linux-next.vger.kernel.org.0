Return-Path: <linux-next+bounces-2737-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1C691D5E8
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 03:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D4B6B20AAF
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 01:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE836FBF;
	Mon,  1 Jul 2024 01:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cvq5RW3/"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A075680;
	Mon,  1 Jul 2024 01:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719799068; cv=none; b=Ddg/VmTfI9arRZH83QG80UOVphgGpyuSMuGQH/6O8i6HYoZlOl7/1hiTFu1h2Wj+EWqAkSlyg4WtTusB1z4yuj2/tPdD7p/8tYn4hViInYswMUHYSzdR6+iA+XrMwIHIzX+WWXjJ68AK6nUXukoluLpMbTcWJ2wYOr5jM+GNPD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719799068; c=relaxed/simple;
	bh=dAcg64ahrUs6xKjPlFG7iXVRMyTH6v1FySymrApX5DM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPKn/Im54dbd/7lJX/EUS8p+vwZLYAt3aM21FmMUOp/C1n8fgLE4zN1e1+rDEUZ3W3T5nVD1aUGFak26aGa50FibmAs/mDVFBDpfpibgHVFNnkY/mX0s6U4rCt4sw6tdqq28mlPm4yuMT+PxPtmK6zuvzPF3JPgpcfuRL6GXUAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cvq5RW3/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
	bh=agTYjNaPrT+m/7rjsG9WXRj8JUSXluViwvnJtTpoSE8=; b=cvq5RW3/I8srt4nQob0QhZ3ycx
	1tdBRjJ689ykiUTk6sRrWQjrMSrxmzW0Yp+srWOEACD/eixoiEZfSVikjgfRoUsbpPMx+KuFwVPqE
	xfhP0Ka0e8O9BZXu3+mvY2T80BT5jOpkWAXS5M63lCnUYuXjf72JME/V8vn+RA1bWYHa/TuUKzKd0
	Zyq03oytT//qWqF6O+6KFaU5QcUWC9rvSQVYyeuOvHIbGU8oAF7Pr6KLE4ostUDEgv3UsLC1EZMs9
	wG6kXF9pM0ynU4r3apBO/AqKYAyInE5aKzltpmQYprVmSIzHjSYdMIkaChyuLNAy/D3YHgdQPgZRY
	rRCkSb4g==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sO6Ib-00000001QiU-1qiC;
	Mon, 01 Jul 2024 01:57:45 +0000
Date: Sun, 30 Jun 2024 18:57:45 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the modules tree
Message-ID: <ZoINGcQwJ4LlqRCN@bombadil.infradead.org>
References: <20240701092429.308aded3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240701092429.308aded3@canb.auug.org.au>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Mon, Jul 01, 2024 at 09:24:29AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Commit
>=20
>   1f3dacc0dcef ("module: create weak dependecies")
>=20
> is missing a Signed-off-by from its committer.

Fixed, thanks.

  Luis

