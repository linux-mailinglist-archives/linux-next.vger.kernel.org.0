Return-Path: <linux-next+bounces-8737-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EA4C13B68
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 10:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1529B1B209FD
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 09:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6ADB2EBDF0;
	Tue, 28 Oct 2025 09:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="aRTEmddh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88042E7BAA;
	Tue, 28 Oct 2025 09:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642402; cv=none; b=sgCwL+6LEMArTrub3+1c5EzVfN4f0jM0TzfgLMsdz7mwkqiipJuW54d3DUGM6o7lbhaU92TogG9gvYsKQZ1X7ul2jrXkYkkmMW008OLN61jzpbjyWJkYrc2j3ZGnfO1gSNERi0pPlxe5/aLrGJrmPpvtVwucK2seABuD7qk5FGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642402; c=relaxed/simple;
	bh=SVq5X7eJRGj0J2ScE4JLqeoU1itieXX0Vwv0It8uou4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pbu/0pGS8ErW8QcWBk7CXKD3oFfstwwS5q9+IODBduUteodDI6+oZOxfwjb8CcKqWjzD9GO5ZGkCnVYb6dkKfWAY+XYPhTOnbplTXMqbT2gk2W2DXOla240Aq9ARGi77Wh6/ICCdWVmNcyQLjAIkVADOApD03IljkpCWbVtOvtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=aRTEmddh; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=PSO5QoqvuDgGQVZqar78ZGKP54TIUD52b9GjICzxvmk=;
	b=aRTEmddhAYY6F0OKzsymjgOlWEN4FmBstD0vPEJAhequ0ccy+UbbENJk/SnYs8
	ej67WFEq5tPhFeRPm9P9a+BtN3Na1MPTVzqINVnSRE2kExY8CN2vkSs4BchtOCfr
	MKhWq0wrr7kHY7d645mc6zw8IcjJhFSllgNl8uT0iw+ro=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCHFhB5hwBpHl_OAA--.26000S3;
	Tue, 28 Oct 2025 17:06:03 +0800 (CST)
Date: Tue, 28 Oct 2025 17:06:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Shawn Guo <shawnguo@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the imx-mxs tree
Message-ID: <aQCHeQCHMydd1a--@dragon>
References: <20251028073346.4b8d68ce@canb.auug.org.au>
 <1c67886b-730e-4a6d-a846-d5e932b452bc@kontron.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c67886b-730e-4a6d-a846-d5e932b452bc@kontron.de>
X-CM-TRANSID:M88vCgCHFhB5hwBpHl_OAA--.26000S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw47XF1DAF47JFyxXw15CFg_yoW3Jrg_ur
	y5A3yDCa42q3yjka4ftwnYvrZ7ta42yrn8tr9YgwnFvrWxXa4DG3sYg34rJ3sxJw1jqws8
	CFy2yFWUWF43ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU88b15UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCx-0ZWkAXSGEgAAAsU

On Tue, Oct 28, 2025 at 08:54:17AM +0100, Frieder Schrempf wrote:
> Am 27.10.25 um 21:33 schrieb Stephen Rothwell:
> > Hi all,
> > 
> > In commit
> > 
> >   9bab9019faa5 ("arm64: dts: imx8mp-kontron: Fix USB OTG role switching")
> > 
> > Fixes tag
> > 
> >   Fixes: 827c007db5f2 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
> > 
> > has these problem(s):
> > 
> > Maybe you meant
> > 
> > Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
> > 
> 
> Thanks for the notice. It seems like I accidentally referenced a commit
> from our downstream tree instead of mainline. Sorry for that.
> 
> 946ab10e3f40 is the correct reference. Can this be fixed somehow?

I fixed it up.

Shawn


