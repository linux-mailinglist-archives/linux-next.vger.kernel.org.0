Return-Path: <linux-next+bounces-2878-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAB892B3A1
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 11:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0324D1C21E33
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 09:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84ED1154C17;
	Tue,  9 Jul 2024 09:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6qdWwU4"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFDB154458;
	Tue,  9 Jul 2024 09:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720517022; cv=none; b=d0tirpO4GnYhL+1G4d0bgPxv5kx7UpcLNKkWNu7sF4HWsz+I0YZsz71QyMKgFdaYlJeQSFBdQCfI5qHlQB7Sb8bTpcfgQJ9jPAaP0FrHizL777M6xbveaodeKKqVss0/vYMBHKNwqih/EpINXQYhnO2PbWeBFqtbI0XvfP12LO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720517022; c=relaxed/simple;
	bh=Zv+pv+pZmKbhIWv+tnX51tCjTYginfxVgAyJhKPvWJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0bvMpBIUMtKn+luUijL+7C/7xz/Fbhc8VmWedGACQLFauWq6QKALZrM8Q+n75NGBrd5QK4/l4dS/ICQ+LZypFl7r+6RoJQQ0PsbvXHhqtXbXw3sSZuz3ygNFtwGWGHPXvOjQ48pWq+Spj0ju0/pnTJ605/ZzAI0/cDPsleyo8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6qdWwU4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BC2C32786;
	Tue,  9 Jul 2024 09:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720517021;
	bh=Zv+pv+pZmKbhIWv+tnX51tCjTYginfxVgAyJhKPvWJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n6qdWwU4JiHjyIS0syIfTQXgfct+41zo7mUBgoXdQpUEjCCC85qDadJSkmL2DKJnP
	 a6zy+v0TO7295Fp0/SRo4FZGy6/Xgjgu6ZiOfXtYGjf/VunFpWkor4kAysxLitszGd
	 oCjMztVS+JK5lFO8cZLMe7JLRMHjpDOPh9yLoIhjmzeQVm/weC2nYyW8j5F/693/sn
	 Hem8he9MbBqkUFeCQbKqUTS8SKZ0wgYbBuOCM/VulpEOsFno9QKq0HDDuCfsfeJj9q
	 20ghgVDXB3yxqLz+qQc5Tq4KrHTOUq2+dKasoEcEPF4Z/C9ZMrAxeCuivXQEtaugQl
	 Vcx1lp802MftQ==
Date: Tue, 9 Jul 2024 10:23:37 +0100
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sebastian Reichel <sre@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: linux-next: manual merge of the battery tree with the leds-lj
 tree
Message-ID: <20240709092337.GB501857@google.com>
References: <20240709133420.55645c59@canb.auug.org.au>
 <20240709161729.27935749@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240709161729.27935749@canb.auug.org.au>

On Tue, 09 Jul 2024, Stephen Rothwell wrote:

> Hi all,
> 
> On Tue, 9 Jul 2024 13:34:20 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the battery tree got a conflict in:
> > 
> >   include/linux/leds.h
> > 
> > between commit:
> > 
> >   6b0d3355e5a5 ("leds: class: Add flag to avoid automatic renaming of LED devices")
> 
> This is also in the mfd tree.

That's intentional.  It's a shared branch.

Same commit ID, right?

-- 
Lee Jones [李琼斯]

