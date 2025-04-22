Return-Path: <linux-next+bounces-6313-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDDAA96070
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 10:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A3D416806C
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 08:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB62241691;
	Tue, 22 Apr 2025 08:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Txu8yv9P"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836AF22A7E9;
	Tue, 22 Apr 2025 08:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309009; cv=none; b=XCPZAuffaX0qZMhzPGGKsuBe4rb+bUF3b0lEBeP/9F3kAJwVIRuzwtmdVtWuzsM00lwQF7ywzogHCcK8hVEoxaZlexGkl3NqQGpOxSxNAOEGsAEDmiXiNB5gMAOsKbCqcFTBX2iE37xLhYAwszeq+y7sHb0kg355HXbhvfKf47c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309009; c=relaxed/simple;
	bh=tuES01nYOstZWP9hYjFzjWNwqXZ8qG6are8+f6QpstA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6Zii9MYVszBz0MrI/sQe3vak5iSOHqcbFwX2AnNS6HwoooPlimymea5p2kWx9T2iAtw9m4l+gnjbbNKGB0gRi0xVwu5z/BhEQ0Hi176GnCiHiMaSwl9nFigIVSgiCQJol9cHl1AZ2sIWIvPRYyYyryXi2KpfX2J7kIGTjMMDeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Txu8yv9P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07134C4CEE9;
	Tue, 22 Apr 2025 08:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745309009;
	bh=tuES01nYOstZWP9hYjFzjWNwqXZ8qG6are8+f6QpstA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Txu8yv9Pi3B9LpKoeLGmibagv3CEzvFuCI4eOcgABFevGtaUqIehpqsrg78/lZZ+F
	 HgAXzAodNblMN+YWNEHGWQyQGgi5dcsgmihLv9txLdLQqIwNJ6Jnwq7IRk8gzvtC5h
	 8NHD1EoCtj40N/ohpMIIZRd7EUklNgN9cuQcoGs/1JayUyiAL6s9CzcsOD+wCmNFF+
	 xGRbhGmg+VSEOdiqRwLBPKcptlbnb17hIGVKEluprU2YlGlnYfl+Wxu5e2cEhdaYTw
	 Ik2QdUVBXZ+4C/o0MAvyQD0XOopQqYuB4/t3DANqfTTLkXJNomjgTPiwzXC87Jimql
	 3RXgtVsJqFqIQ==
Date: Tue, 22 Apr 2025 10:03:25 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20250422-geopfert-scham-999c2bdd6e34@brauner>
References: <20250417084949.7f9cfe19@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417084949.7f9cfe19@canb.auug.org.au>

On Thu, Apr 17, 2025 at 08:49:49AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the vfs-brauner-fixes tree as a different
> commit (but the same patch):
> 
>   b1eb86b028e1 ("fs: ensure that *path_locked*() helpers leave passed path pristine")
> 
> This is commit
> 
>   a681b7c17dd2 ("fs: ensure that *path_locked*() helpers leave passed path pristine")
> 
> in the vfs-brauner tree.

Fixed a few days ago. Thanks!

