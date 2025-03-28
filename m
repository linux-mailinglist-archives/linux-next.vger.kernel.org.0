Return-Path: <linux-next+bounces-6072-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDC9A74F9F
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 18:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C576A3AA998
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 17:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6191D5AAD;
	Fri, 28 Mar 2025 17:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYheuJGP"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D152B14A0BC;
	Fri, 28 Mar 2025 17:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183549; cv=none; b=oBk2E2L7+4L235ONS4x6d2Y0dnuiCHQagMt3PcIjwfIV0VMATS6gHqdmx47pOZwWb7s8OYRR8VG+tQbBF3Vc9yPnC0GlJSHomdwhFzar9QOjw7JubZXMvCs2xYUgQEyLt7zwGbA3INIIUH2uCBj7AhmKpMlu6+tcUv3dr1ouD4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183549; c=relaxed/simple;
	bh=3Hnco4Lq8j7mav0v3HLC9HQFOXmI4etu/xJ3XVVScKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=heY1NAX4MNX+T7mvssxSGxKndctOFAVdmgzdr9u9KrDclXucSbWbVld+xR7wVHxqD46cVCAlu5MkGNTHusChDqJjn0fnLuFw6jMnOhgxJyh78V15Mpc4NTl26MfYLk0ZvNeQTXgPnL/J48GztDZncaiM9Uul1QDzUOelQTozgjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYheuJGP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1E5C4CEE8;
	Fri, 28 Mar 2025 17:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743183549;
	bh=3Hnco4Lq8j7mav0v3HLC9HQFOXmI4etu/xJ3XVVScKQ=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=jYheuJGPM7cnLp6002uFjKreQKpT2+G8eOGHUGBoCJb5/j9CPgXI62NDmCB10WFm1
	 BjHZKKKiKBhzS4ZaJOVD8YU3Jy3u9ij3vLRKybTYiCpiLezCkAfnsc1Rrml7CzS4yd
	 FJqooUkazg6p+qRHivkgHvwBvVwMWGJnZsx4vjRxDq10IVBybhVukUUsFXvyvtY7w0
	 EPLjKOg0vNC5ger/asB+yAXdUosVu6/LD6D9g/8FtVyVWb1NQIKRP7jZvV83LHSbxm
	 nLSuuGr8USXkpKmorvQxp/NMKJdee+Oe8FO7uoEmdlBDh2BcQLzJeNyqdf2LEXwrMY
	 9WnFupj84dBZg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E379BCE077C; Fri, 28 Mar 2025 10:39:08 -0700 (PDT)
Date: Fri, 28 Mar 2025 10:39:08 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-cxl@vger.kernel.org
Cc: dave@stgolabs.net, jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, dan.j.williams@intel.com, gourry@gourry.net,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	sfr@canb.auug.org.au
Subject: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
Message-ID: <f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

In next-20250328 and next-20250327, allmodconfig builds get me:

./usr/include/cxl/features.h:11:10: fatal error: uuid/uuid.h: No such file or directory

This file is apparently auto-generated, because when I change the #include
to the more likely linux/uuid.h, my changes are overwritten by the build.

Gregory Price noted that something similar has happened recently and been fixed:

https://lore.kernel.org/all/70ba4e80-53c4-4583-82f3-2851e0829aa6@linux.ibm.com/

Perhaps someone unfixed it?

								Thanx, Paul

