Return-Path: <linux-next+bounces-4026-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A7298B2C9
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 05:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D1BB1F23EDC
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 03:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DB41A3BAB;
	Tue,  1 Oct 2024 03:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sdXVQS1i"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA37170A18
	for <linux-next@vger.kernel.org>; Tue,  1 Oct 2024 03:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727754118; cv=none; b=n+I0Mos4q5bo2+g7aUtTDUreBck09qC0NakUWzTTTaPA0fphrEX4JQEjEYWo7DSubuYeSVY6EdsyVonvfsigOMW9H1tmK6Pri7qGw4+Wf7pMYLaXuh92h5hwtccIxNmQueD46cKcujP/DPjGFnCQjUVOan0LFzQhaiIPjh0FBSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727754118; c=relaxed/simple;
	bh=4mtqjufrGzTh3KTrYNICzXzLUr5PuW+levoNX5ARjUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m8LmFVPvrwbOJo9xJL+mcCuHXCqfu4zoDtsYkd6yU5fJZdSQTA+KVqRuN3qasASPQM5KvrMFSa5onnJFRWOkFRzs58VO1UpN8i3u1QuZs1GaypbKgpSqKGd14URlIFVWbyGcdNImCofpwd4cQMKaewK23Z8TsyPHG5c7HBGW/gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sdXVQS1i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CF5C4CEC6;
	Tue,  1 Oct 2024 03:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727754118;
	bh=4mtqjufrGzTh3KTrYNICzXzLUr5PuW+levoNX5ARjUI=;
	h=Date:From:To:Cc:Subject:From;
	b=sdXVQS1iyDz8qwTKLgKYF/J8IjbYK4PZl3uQeht1RC7Yb7kPav5Lj9XO/86HY3WXf
	 LnAoqLFi6ffK/qLDMidkGWdaD6Qw1nxilf1IF+mFfbJnA0MuQefiJzyDKp/Tyv4A7G
	 GdkWfGptWKxh4V+wcCppkCxXv+K8POXt8jVJGUret5wErfkTYJq5c/1QgoQ9HwRKx2
	 QNBR8/2y5OdDtOyD44o+eERED2H0xDn1LKuRmVMxYq2IQ/WjrZ+jJNh3jaZJOVV/82
	 JYJ6WPROD5wgYRcvjQeaoLtT1HU2e2L7yZVtkq2HIKtrfrsFcP9lvRnX4F2g5jefgM
	 Pb+5sXjK8H2hQ==
Date: Mon, 30 Sep 2024 22:41:55 -0500
From: Serge Hallyn <sergeh@kernel.org>
To: linux-next@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Please include capabilities tree for testing
Message-ID: <Zvtvg1SqyMOsgfD3@honeybadger>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

please add the capabilities-next tree,

git://git.kernel.org/pub/scm/linux/kernel/git/sergeh/linux.git  #caps-next

to linux-next.  There's just one patch in there right now, and I don't
expect to ever have much more than that.

thanks,
-serge

