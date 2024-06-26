Return-Path: <linux-next+bounces-2680-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0724B918A19
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 19:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B18DA1F24ECB
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 17:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2345C18FDC6;
	Wed, 26 Jun 2024 17:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DW91Cf14"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7AC18FC63;
	Wed, 26 Jun 2024 17:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719422928; cv=none; b=Y0GtMsZBwt0IU4WvRFdDcXFxfUAgdQOl3PwFWlBph/hyLocV6V0wa8wj8RgmsaduzNZ8Ju2AdE3LiCROpqbJhhiYoFMwwkvTCCvt2FequpCEScu/s84pr2tYC70CgiWX51nw11Mis4nKhyyME0Uhzelj2cHRwD7leMIXn4oTFSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719422928; c=relaxed/simple;
	bh=Csgv3p+PDJR9HK5TjnVy6Wk4W5tHXp5/tOgJeilTFPY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=V3sVd7Nrlp+wVJAOBJ8VskylliQ2lceIn+aOciFFaeCPwBwhAoK1e77nw9xxIwYXGpYAFBobbO4/WehalLqvu2sbe1mcAukUxBCOK+pxVbWnii3M4R/QUno5K3pha0uL9VGNNyMd7RgHm3bTvwHN2NYhi0QJxuKgSEzMgAeQIVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DW91Cf14; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F18FC116B1;
	Wed, 26 Jun 2024 17:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1719422927;
	bh=Csgv3p+PDJR9HK5TjnVy6Wk4W5tHXp5/tOgJeilTFPY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DW91Cf14W53gkssIuWGexeJeBpWO39VhmBvZ5bGDAZuuSWI7ZmTt2UiGB+cgoEHs+
	 BTApzf8uZ7EN1anpPy4w3Nf+HjNu0MYTOctNET2JCLK1bZ7rDep+tP9NZPEXLMojF+
	 zrWqj2/CoxuFWt2R5QdWfHAc15WwPMMHZqqnbrQo=
Date: Wed, 26 Jun 2024 10:28:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>,
 linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
 linux-mm@kvack.org, liam.howlett@oracle.com, zhangpeng.00@bytedance.com,
 willy@infradead.org, linux-next@vger.kernel.org, Hugh Dickins
 <hughd@google.com>
Subject: Re: [PATCH 13/18] maple_tree: simplify mas_commit_b_node()
Message-Id: <20240626102846.159a7b4df25e8a28fd10be12@linux-foundation.org>
In-Reply-To: <nchlkncjvmkhyw3fcp73defvj2dfd4ylheajlvtcfcvvs7ipo7@3xdxzwaa7duf>
References: <20240604174145.563900-1-sidhartha.kumar@oracle.com>
	<20240604174145.563900-14-sidhartha.kumar@oracle.com>
	<nchlkncjvmkhyw3fcp73defvj2dfd4ylheajlvtcfcvvs7ipo7@3xdxzwaa7duf>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Jun 2024 12:40:19 +0200 Mateusz Guzik <mjguzik@gmail.com> wrote:

> This reliably results in "kernel BUG at mm/mmap.c:3412!".

Thanks, I'll drop v3 of the series "Introduce a store type enum for the
Maple tree"

