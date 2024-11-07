Return-Path: <linux-next+bounces-4669-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0633B9C06FA
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 14:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 915F3B23D69
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 13:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C501EE039;
	Thu,  7 Nov 2024 13:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chJbdCzV"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17B31DBB37;
	Thu,  7 Nov 2024 13:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730985085; cv=none; b=jF6ggASVM34+xyZr7NL+YnVbnxt6/UXiv7RPDOGHCSreQJBf6eAJwU8EYfOKNwCSZfYSYlcLoG5jcFyHKbFRVm7DqwVfPjNgQTpL7dF8JUpybPHy/OmzepEQoCFvLH7tMFHRZblXcIhU2qT2gNlsSTAbuP47FY4B1u+xJlEYwzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730985085; c=relaxed/simple;
	bh=VW2FpAO8sqaHhfixyY+M0ih0cCjpw4i0naO5w2pm+RE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=FzKS93pDMIK60+PWcPywFL1wL+jWwAdTsyt1oxitURFPhSjU9HmJU+K3/AJqrNHPG+4OQtSavunpMZUZwM7eCcjT2jrm7+uK+rw6Pwk9CULjfeKh5hCQnf8MUNAyHNv+bs7sj0v2cCRMqSwKLtQR8O2Xhsu2z2aAek5IBREPXVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chJbdCzV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6037FC4CECC;
	Thu,  7 Nov 2024 13:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730985084;
	bh=VW2FpAO8sqaHhfixyY+M0ih0cCjpw4i0naO5w2pm+RE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=chJbdCzVwZftpKvRlmldEsw3wWr59CrJWJlc3dy8LFRJ8wb8qKDB773Q1dtujU4mq
	 tkfEi5npvYVyqMtjXaQXfADE5BCSS1mB5+7q3iDDfOe1g7zDVD4SOQRff/7gvoxuxx
	 HrBhdiWSrdJjweuP969Iyav2dZmfOqqlSdsnpIFQgyZ+sV9OeNGViaK3Y3LNWF74Kf
	 /O3VQP7CcG2hkCs82k1qhGWd6yFI5hVJGDXGjV8l78ErDSvra1aLLodQ2W9X6hjHJT
	 LDYSEFO5UbfwW+ZlJ5OZMMsoa/OVEU3vjdFvEwQyw8+8tM5HkW5tQfI8GGz/2qWw+a
	 IjuiVXkaaKhFw==
Date: Thu, 7 Nov 2024 07:11:21 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Philipp Stanner <pstanner@redhat.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the pci tree
Message-ID: <20241107131121.GA1603326@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa092ae5-d15d-4f53-9de5-d06ebd985b33@kernel.dk>

On Thu, Nov 07, 2024 at 05:49:18AM -0700, Jens Axboe wrote:
> On 11/7/24 1:13 AM, Philipp Stanner wrote:
> > On Thu, 2024-11-07 at 16:24 +1100, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Today's linux-next merge of the block tree got a conflict in:
> >>
> >>   drivers/block/mtip32xx/mtip32xx.c
> >>
> >> between commit:
> >>
> >>   5080394a8fcb ("block: mtip32xx: Replace deprecated PCI functions")
> >>
> >> from the pci tree and commit:
> >>
> >>   91ff97a72259 ("mtip32xx: Replace deprecated PCI functions")
> >>
> >> from the block tree.
> > 
> > Ooops, that should not have happened – I must have lost overview over
> > my branches when submitting the latter.
> 
> Ehm that's not good. I can't drop it from the block tree, I have
> merges sitting on top of it. Can it be dropped from the PCI tree?

Sure.  5080394a8fcb dropped from the PCI tree.

