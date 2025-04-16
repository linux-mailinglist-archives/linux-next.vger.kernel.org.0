Return-Path: <linux-next+bounces-6264-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6332FA8B015
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 08:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5D7B189E563
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 06:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F62A188733;
	Wed, 16 Apr 2025 06:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iGjuLLjs"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606933597A
	for <linux-next@vger.kernel.org>; Wed, 16 Apr 2025 06:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744783900; cv=none; b=VrkPHKEtsK3pxRtQioRD0lA8OUONG74I12j5Y6scmJWU8lzoLyGhj/ITmfmmSrzaxLx9q6D4HadeQaNfxQq1jNDIR7eMlOuji/0zi2xSnlcQ7jUjvIGXTPjzd1MX2hFCNXu20j8/CRMlbj8zcP03chrDZPMzVg5cgFdXoSWmUw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744783900; c=relaxed/simple;
	bh=W8sC/Jkv/Do5OuPKmfXLcvKdao6phLoV0CXN3Q57NPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6DrfzcTFLfxzkad0FuTU5U8QVx531rY/3Pq2xRHKz8wTqCfeOTXNGLBlEhY0dNjxBfWh1xUjaeWFSyL54ub3rvgw8zFwwNmIP0gZ6p4PAtIBltiuozJywvhsA/6My3bWaiCMWInv3aMvIOyjPar6nS8fAiaifCy2GmIb3XTLaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iGjuLLjs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777E8C4CEE2;
	Wed, 16 Apr 2025 06:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744783899;
	bh=W8sC/Jkv/Do5OuPKmfXLcvKdao6phLoV0CXN3Q57NPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iGjuLLjsShc918tLKpKTTtpGhLN+d32QdwoRzpZKQXbgaLILxX+/MoWnUNu9jJ8Wh
	 OTuNpj3AkeDffYno6eSAiQpcn7OX8pu9mDpCbmCMgp1WHQ5FtbGcEIvkx4pLIFr8+k
	 2fHIOVCzqpw2E5EjaRLqPFTP5pKeTPcKrWOv29jA=
Date: Wed, 16 Apr 2025 08:10:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Li, Philip" <philip.li@intel.com>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, lkp <lkp@intel.com>,
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Re: The driver-core.git tree has moved.
Message-ID: <2025041657-arguable-reflector-5ab3@gregkh>
References: <2025041512-darling-erupt-4545@gregkh>
 <SJ0PR11MB568008B6732C110FF372E645E0B22@SJ0PR11MB5680.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR11MB568008B6732C110FF372E645E0B22@SJ0PR11MB5680.namprd11.prod.outlook.com>

On Tue, Apr 15, 2025 at 01:15:41PM +0000, Li, Philip wrote:
> > Subject: The driver-core.git tree has moved.
> > 
> > The driver-core.git tree has moved from:
> > 
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
> > to
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
> > 
> > So can you adjust this in the linux-next and 0-day bot scripts so that
> > you can pull in the updated stuff?
> 
> This is done for the 0-day side, thanks

thank you!

