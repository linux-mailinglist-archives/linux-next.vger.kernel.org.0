Return-Path: <linux-next+bounces-5076-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90918A03792
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 07:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69AFB1638C5
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 06:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C7F14B087;
	Tue,  7 Jan 2025 06:03:11 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0204E86329;
	Tue,  7 Jan 2025 06:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736229791; cv=none; b=lIlT38k8otWeMX+RNsheHssVNt8t+kgv8vn+9DDd7KwRLK4CeklATvjtJOoqqNLQfHlELbHJDZx9ZxgCk4PLzws44PsF8uCA+lVC7A3k249aPu06IyD5V8HAJzhBzBAs8vI0N+fNEA77sijLqFlE7uCCI2kLAaG/23jMRALJEN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736229791; c=relaxed/simple;
	bh=U0FVUAmpONBSbDzSu13fkYYwiTmC1dnRbT9TcMZqkeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEcyU0gigs8Bd6UaTyDqSJGv8ARsvr3yRmprSVEKAnwAzgz5xgN98hOkWqkkBVltSoi4uP8zYM1M95nirEaHJq0hnJismJy2OpN3eoJDe/B5JpybbRWVIfu1lYmBO4llEcOstIMarK+CrDd3AzO6OeXOMkoZAJN4x509wLe667g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id E28EE67373; Tue,  7 Jan 2025 07:03:01 +0100 (CET)
Date: Tue, 7 Jan 2025 07:03:01 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Jens Axboe <axboe@kernel.dk>, Bart Van Assche <bvanassche@acm.org>,
	Christoph Hellwig <hch@lst.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: manual merge of the scsi tree with the block tree
Message-ID: <20250107060301.GA13669@lst.de>
References: <20250107150937.773b3776@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107150937.773b3776@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks Stephen,

the merge looks good.


