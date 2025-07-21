Return-Path: <linux-next+bounces-7653-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC4FB0BE06
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 09:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D136B3A680E
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 07:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0561E19CD0B;
	Mon, 21 Jul 2025 07:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5m14lUF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D071EE555;
	Mon, 21 Jul 2025 07:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753084077; cv=none; b=dTvsmGzNzESPs6UYD9hJPl+oORmPGLU25fky8hwi+Q+xQLXllMnMAvLQtxcSvtpyAwzzv1o4uk3otnWwz3w525A8ZtbL2Glbb+bnQKTtQUesrxRGyDdTRZ8TYqYdHjX1bbM5678YjxKGCdmvStlI+kdJk6BqEQLqD20J+QG4P4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753084077; c=relaxed/simple;
	bh=WlDUpuYONYcrPrqQ5i5ytY5dEIrzG/8PPi8rhTGhQ44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Whvop36cXPYj7a5wAmlfgt+A3OyFuBo2s0yZ/q4ZVpoBS/ucZSfpA6r9G/yEatZpbhaFcw+lNP1thr//sbgJdlOY7Ij409QJbVhTJrZL/JDtVdqSh5+uTjj6qEDNpB6hdaQFlb4zwY8OibyVdRcF8Ne3hJRwq6DQpHcZeUqY/ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5m14lUF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79287C4CEED;
	Mon, 21 Jul 2025 07:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753084077;
	bh=WlDUpuYONYcrPrqQ5i5ytY5dEIrzG/8PPi8rhTGhQ44=;
	h=Date:From:To:Cc:Subject:From;
	b=j5m14lUF8KHh59Onfexc3salb9GgFDHu7q0BvL1DqjHeEp4/DeEf1VNFb200yIP4t
	 LbkckaU4f5xmknQjXbf5z8uIAqpwJu4TPcamQ6+1jWN9XUYQaEiJZ5Hi6VE9WkvuGi
	 k5zOMBim7/j/1yOLBeqSTgA5V43ZGqXZz/0KPuidt0tcEjtImm55JonWhA0Jkuy/g/
	 ag83t0ZXV01U3zyVwsZvRtz63JiVl4CEmaj/Z/eW8wNYrQOItJklxXCRELr7vm99vc
	 AzY1FA/pRG/rCeN2wjBBjsgiluM468oxDMPfUr2beFUdOg42YN2ha5QumcEK+U13th
	 HwSHKxxIA12lg==
Date: Mon, 21 Jul 2025 00:47:56 -0700
From: Drew Fustini <fustini@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Move thead clk and dt trees to kernel.org
Message-ID: <aH3wrHifvImaUUiN@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

I've recently gotten a kernel.org account moved the thead clk and dt trees from github to kernel.org:


thead-clk	git	git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git#thead-clk-for-next
head-clk-fixes	git	git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git#thead-clk-fixes
thead-dt	git	git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git#thead-dt-for-next
thead-dt-fixes	git	git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git#thead-dt-fixes

Thank you,
Drew

