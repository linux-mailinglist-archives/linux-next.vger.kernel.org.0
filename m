Return-Path: <linux-next+bounces-3703-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB65397192B
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 14:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 230E71C21962
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 12:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65E61B29C9;
	Mon,  9 Sep 2024 12:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYInJIte"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEF4175D4A;
	Mon,  9 Sep 2024 12:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725884360; cv=none; b=A/qXtHN95JmgE/TlrK8x4s3XQRcCA6zBwhW5zfXUJYztT+m24xreVQG74jfBo2DXTgZ2jzuLFiVVF8LGAdrJONusK69nXfoPsB/tMz4bTg9Sbul/zq4WgZBfwXIoAVOEU75LQaHHnWdC6v3QJvQxjpN7wQcFlgpTV4lZIct6oR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725884360; c=relaxed/simple;
	bh=CzEIEHL1o6eFvnmElVKu3c8F7CiEi/LnWipQ97SnXhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEs+y0R1ijkU3VLorMI9cnsu9E730O5M7ZHrf4YHGjyUqtCPsiXVMTfoXIn4KRmQwEOxyFqY8/vttK5P37kdU45M4yRdQSB6Zsx7y/6MVoXpngqHWp/Tk9IOJoFCLGRCJM7n9YbNm2UI58t/znFtGcJQONZaei9WJXHkLa8wXF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYInJIte; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB15AC4CEC5;
	Mon,  9 Sep 2024 12:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725884360;
	bh=CzEIEHL1o6eFvnmElVKu3c8F7CiEi/LnWipQ97SnXhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GYInJIte/wKbwFlDJTCJwJKRLqV1kuqPk69k3wL284HK28XzmBjglfaxNQheOpDwN
	 rNKohDaIxEfGGKmUlLDcx4q5tIE2gtCByrgv38HH3ir6w9eMpC/YSnk5HHpOmQcytI
	 6s/QrvWL/ZuCyCys5/Z7jJWLWpYe3pOfuidGyJHTMr8Jiohdcir3bDBoJsXvvhW6jx
	 ZzI0jg9OeL9Yb2goLAVcmLx3NS8yYNnsjJq/JXwG/NXCo0wsLa28CQxph25wf3WhvH
	 1xazzwz0ylGbPz6YO8yHFhgI1xxRQelUp2EbxYSyznRz6lH2QLDp05rYVTU0S2SpQ0
	 h7GU31knFJYtg==
Date: Mon, 9 Sep 2024 14:19:15 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vlastimil Babka <vbabka@suse.cz>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the slab tree
Message-ID: <20240909-fahren-ansah-1b49bad59efd@brauner>
References: <20240909171220.32e862e3@canb.auug.org.au>
 <af23f1d3-27de-4591-ab0a-02268ef547a3@suse.cz>
 <20240909-organismus-sattbekommen-06332e10fcd1@brauner>
 <5661a983-9875-4cdb-8bdb-fc83e82f0b58@suse.cz>
 <20240909-anvisiert-weltweit-d3b485680666@brauner>
 <ffdcd6ff-b83a-47f6-bb23-e6baca7a3bc2@suse.cz>
 <20240909-missrede-abverlangen-dfccd1414bb2@brauner>
 <20240909-kratzen-holzweg-c1fd7da1f895@brauner>
 <20240909214533.0f8437ef@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909214533.0f8437ef@canb.auug.org.au>

On Mon, Sep 09, 2024 at 09:45:33PM GMT, Stephen Rothwell wrote:
> Hi Christian,
> 
> On Mon, 9 Sep 2024 13:02:03 +0200 Christian Brauner <brauner@kernel.org> wrote:
> >
> > Ok, how's it looking now?
> 
> I just fetched your tree.  The top commit (vfs.all branch) is
> 
>   a80a1ee241e7 ("Merge branch 'vfs.procfs' into vfs.all Signed-off-by: Christian Brauner <brauner@kernel.org>")
> 
> and commits
> 
>   f2b8943e64a8 ("fs: pack struct file")
>   c0390d541128 ("fs: pack struct file")

Sorry, I just pushed the fixed version now. Thanks for the patience.

