Return-Path: <linux-next+bounces-6218-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD0AA87E58
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 13:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 224C03B5026
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 11:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85EB2280CF2;
	Mon, 14 Apr 2025 11:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jg3QdPDq"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E03A199230;
	Mon, 14 Apr 2025 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744628685; cv=none; b=CIN8G4UD2W+q8QMZiQZd7T0MQfjtMMsBh+RB6FTucwuWVT0GT2W6jTbf9eIB0vPYEjqqY97kbnQFCJ0aPnc05gimbPJ2LPRsfHSJOGY3Maf2Gp05HCE6Ae96QXmme1xvqAhOJT6v4nPcvDYs3g3bPbAWDRbtV6Q6Dc888q4k/TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744628685; c=relaxed/simple;
	bh=XI/SngeCTNuyvnTlLp9ZZyfg1dedxUxP0sNHfN5lV+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGSTIuiLSwq06AMnH4Qfm+KJftL3WENoWrJgzHouSPKwGBng4gpen7MGUDw8LvlkUzr54UcQBe9sOXvbaLzVgCFqB0IhmhHTF/8Vm4hlnl4fTqacixr7hco76EbGVNavQlsrNJqi9CsI7wtN1A9/u0Ueo0+jZyiBjKYxze5Q3Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jg3QdPDq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71C9C4CEEB;
	Mon, 14 Apr 2025 11:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744628683;
	bh=XI/SngeCTNuyvnTlLp9ZZyfg1dedxUxP0sNHfN5lV+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jg3QdPDqX9AlljqOg4MeOplOJxr4MNLBde8YDNq5lI4DUwXGfrTxq4tHZLqOt6nY4
	 1EcMAl6gP94KMFpK6ArUK84Xd6zLD3RVKGybdIS5l/FQmu0kmX3Yauf1whskfFv3xA
	 +lUTZZifpcZlXxXcHvoqCn+VyrGy5h9WK3QqcvC78ihe2rwJ840URJhXGPcabDaU+4
	 4LmVJ+vaVzYz78cQCZUXaKPlmdFpVHlxPeSlLGdnyVozrNrcEs4gR+a/HGdPAoPJxy
	 19AyRx4fvqGtLizY8qQp8rAsgOSovAOcTxaWZhcLeaqQPeXVE6EMVOoj/sGJksGE73
	 sSgsIfklSv7Yw==
Date: Mon, 14 Apr 2025 13:04:40 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <20250414-abgeneigt-zubetoniert-09f6e27af565@brauner>
References: <20250414082306.577df183@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250414082306.577df183@canb.auug.org.au>

On Mon, Apr 14, 2025 at 08:23:06AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   a8fca9b51158 ("fs/fs_parse: Correct comments of fs_validate_description()")
> 
> is missing a Signed-off-by from its committer.

Thanks! Will fix!

