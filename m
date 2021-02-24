Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242D63245D4
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 22:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232469AbhBXVch (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Feb 2021 16:32:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:49618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235666AbhBXVcc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Feb 2021 16:32:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D90C664F0A;
        Wed, 24 Feb 2021 21:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614202312;
        bh=if8HeuBWKaNI5EkQpH4+SNiwWl4lb27CV3XHck4etf4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=fv2AkkJIQ/ksHVpQqauCjD1/MnFndWS8FeZ5J0FnUsyVKf6tpI2zMwt6W2H4baH95
         DqsW3n5lkdw3BSc+1sFvUnOAWr0MX5PyoKFvOT4efcmDTnB8Oubd4kMb5kNyKCFM8M
         Jy0z7KeRzH0ujSOeijhwNqpnEYUQiD5YLFZi5Fd2wQM9qfo64gFCQd3OfvcqERIfDF
         HvhX4l8X/H8vH83nlMjzbodpZn8U4OYugl8mBVfbGWo8Pgct2y0KH2EAl/rouKwd3f
         nm8+Utf8rCtemmNq8lGnA6UwR8IuP33Di11j+OGlP1ejA8p8gQiU2kg7BucEhpYMld
         V+FlPqHYZJtJg==
Date:   Wed, 24 Feb 2021 15:31:49 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the pci tree
Message-ID: <20210224213149.GA1609582@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225072131.7e30277f@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 25, 2021 at 07:21:31AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   557fb5faf4ca ("PCI: qcom: Add support for ddrss_sf_tbu clock")
>   3d0e5cf9c062 ("dt-bindings: PCI: qcom: Document ddrss_sf_tbu clock for sm8250")
> 
> are missing a Signed-off-by from their committer.

Thanks, Stephen, I fixed these.  Sigh, it's not my day ;)
