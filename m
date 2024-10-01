Return-Path: <linux-next+bounces-4047-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C56798C11E
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 17:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEB7E1F22DC3
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 15:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD931CF2B9;
	Tue,  1 Oct 2024 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efPru58A"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244731CF2B7;
	Tue,  1 Oct 2024 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727794977; cv=none; b=cWVvpEVvTUF6RnVweFrxrelx3buF+XqWnZ60PYQmK7/e4xEyXqNb/59elYGiYZnTzVw4t84+SOIdPom0DaQOURAeTd1c6JUC2bxjrEC2HcW7YQO0sTGQXORJHUEFd0wOCxLLWkHdg1k3Gid+r/WHAlPFaTXOl3iWTTCTcXONlV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727794977; c=relaxed/simple;
	bh=XsMZY3pc/vg+/x1k0lQTUXSC5AqXsrwwKZxZ8pCceoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSKZNWqgd5KDwzBpdbCJwKyblHeIORmUxM2Tl3RSMG8dg2Eu5D5C54/lG/7dIh9bbB2TycuzVun9vz+pkf1G7wBiaeuirpIuEUtLRy/LTUJw7TNY39+nfZlpccVOKQw2OoXumyxgNBK0Y0z8hPf34OKxXnrw3mirMPA+YOzh/W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efPru58A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2B8C4CECD;
	Tue,  1 Oct 2024 15:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727794976;
	bh=XsMZY3pc/vg+/x1k0lQTUXSC5AqXsrwwKZxZ8pCceoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=efPru58A1wFOI1VnQW+3jOZfpaEoOWXsZZuxmDLQ6/HvAXw961A6O+jKwZBPV7T04
	 tfUzNDuBj7e7ofHbb4MQgirm8Hacsqvp3ViVW1840i3Obidu8IJO1nUOVJyenKdgQA
	 u0oAWYY3XqLAmI/BPnJCmEY9D8yqKpKfGQ24Z3qtfEva6dIc9r/MGde7Jq6JkcSkfg
	 e34uBifbuW/bhozB1SS13zZhwt8ekFalS9zVGGaj9JMgYjJScBOKwl6H7HZM+KkFIU
	 eC5l1YqFMx3wzlM1ttG8uIaF9l8Y4BC1a73CLROgDq4ZCHpbDsyskfyuml1MoUc8SE
	 kjSMVv8TJrevg==
Date: Tue, 1 Oct 2024 17:02:53 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Howells <dhowells@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of Linus' tree
Message-ID: <20241001-sprung-befeuern-b3daeaeec154@brauner>
References: <20241001134729.3f65ae78@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001134729.3f65ae78@canb.auug.org.au>

On Tue, Oct 01, 2024 at 01:47:29PM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> After merging Linus' tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> include/linux/folio_queue.h:91: warning: expecting prototype for folioq_count(). Prototype was for folioq_full() instead
> 
> Introduced by commit
> 
>   28e8c5c095ec ("netfs: Add folio_queue API documentation")

Added a commit to fix this. Thanks!

