Return-Path: <linux-next+bounces-4246-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B34EA99A36E
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 14:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5CE5B247D3
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 12:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2244217306;
	Fri, 11 Oct 2024 12:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G4eHLbzU"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C209216A32;
	Fri, 11 Oct 2024 12:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648572; cv=none; b=Fln4isJyLhGKdOBs9kCbw9n7EIpr5VDSmQ+DihcMTQxFpxbJ1kfZUBfVocch5I4H0TCKCvzyhQH6sS49VJAVIn9Q1fQ8vVZp2HZNvPDN2I4MOg4Jf9f2D0uvdMKVRpEc//aKbzBVPcX+y/BRBci1HOwdu6cKJrKW38MwhfsVyI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648572; c=relaxed/simple;
	bh=VnpWk4eGdMd6E9wB55AiSzHTxcmv05qwkE1hMVJMCWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQP0gLb7YBzNp1jyxyEbe9A+708Z3LTcZ9z/yKTkuh3Md2ToiRM6Mr/8b/caeNnDdThI90+LiYr2HWCmh9myPMW9Tfef8S8d7om14bvihawx+EQgfieil4BH4ZoiEb6w8cbyvyFEGMGDA35LasxcQhKhKnY0+gHfYVZmMyyYyAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G4eHLbzU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7331C4CEC3;
	Fri, 11 Oct 2024 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728648572;
	bh=VnpWk4eGdMd6E9wB55AiSzHTxcmv05qwkE1hMVJMCWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G4eHLbzUOqj3Y3uEImz1qasUzOyWPKUEs+ocBWHN/gktItFwnl9pDDNX0ecvjAGbu
	 qUinDUMEu2uy04EBXbaA+AUyjd1WmOcYEpyrxZ6Y42HHxCfVUAsncwTRhpMr6an3zI
	 WbWHYtp7V8iDTET3y1BTDRP+bQFZyhUefdzPAT8E=
Date: Fri, 11 Oct 2024 14:09:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Abhash Jha <abhashkumarjha123@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the iio tree
Message-ID: <2024101117-revolver-sadness-24bb@gregkh>
References: <20241011154241.511878bd@canb.auug.org.au>
 <20241011104232.000042a9@Huawei.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011104232.000042a9@Huawei.com>

On Fri, Oct 11, 2024 at 10:42:32AM +0100, Jonathan Cameron wrote:
> On Fri, 11 Oct 2024 15:42:41 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> >
> Thanks Stephen,
> 
> I'll call these out (I think we have 3 of them now) when I send Greg a pull request as
> probably best place to tidy this up is when merging into char-misc which has
> merged rc2 with Al's patch.
> 
> Greg, let me know if you'd rather I handled these in the iio tree
> (probably a merge of rc2 as I'd rather not rebase)

In your tree is fine with me!

thanks,

greg k-h

