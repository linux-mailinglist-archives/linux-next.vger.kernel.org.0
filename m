Return-Path: <linux-next+bounces-6251-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F06A89D07
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 14:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35326175B82
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 12:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966E828DF08;
	Tue, 15 Apr 2025 12:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qS6RPN1o"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700FE2750F2
	for <linux-next@vger.kernel.org>; Tue, 15 Apr 2025 12:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718427; cv=none; b=ETYXAEwpirhyoaeyXV/Vf1xUyW76gP7io1Qy+xvw+E4aKCEfcg+38e2iNmv1Wyys45M4OFRRkuMLzJVUfEHkDV8az2A3VQIdRT+H7md+idtEnIXiQqTundrgj0MOpsQt/tg+j3v7ahYvj8VdAbXy0b5dySqNJAEPyVNDomRA7LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718427; c=relaxed/simple;
	bh=6bV6Di000BZYUBIaC4G58Gz8u4RXxR2xT4dqkJ3/UUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JvZ3oiwVpiirWo20cbQMhDUBTr+opzkm0LAZXXMroAeAaduqGvFJbkGfmmwBmvvsvw2ckxTD7cT8uuew/WkVQHJ+yMn9uRAIS/oiRfMqtOdTlfZK8kgGvQdyDpzIbV5nGD4U9CpBm7bOK+9LQUjXizG7QHLl6iE8FD6MDkLuE64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qS6RPN1o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA54C4CEDD;
	Tue, 15 Apr 2025 12:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744718426;
	bh=6bV6Di000BZYUBIaC4G58Gz8u4RXxR2xT4dqkJ3/UUw=;
	h=Date:From:To:Cc:Subject:From;
	b=qS6RPN1o9e0UVXqeSuW+gNGisYRseAyiIkAt2kei43bdlS66+hhVzhC39RcA2uSsk
	 Kx25Zzsao/KLO1FHL7sw9Mhuur4XxizeR0c8u3VE2aQviUADIKoKlNNoj+YEWgcv4L
	 5AbQw6TCA8iSgyVaqy/vMMNpDSZrVrUPMuT4q/MM=
Date: Tue, 15 Apr 2025 14:00:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: sfr@canb.auug.org.au, kernel test robot <lkp@intel.com>
Cc: linux-next@vger.kernel.org
Subject: The driver-core.git tree has moved.
Message-ID: <2025041512-darling-erupt-4545@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The driver-core.git tree has moved from:

	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
to
	git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

So can you adjust this in the linux-next and 0-day bot scripts so that
you can pull in the updated stuff?

thanks,

greg k-h

