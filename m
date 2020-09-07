Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABEF25F1FF
	for <lists+linux-next@lfdr.de>; Mon,  7 Sep 2020 05:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgIGDOW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Sep 2020 23:14:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:35758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726278AbgIGDOW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 6 Sep 2020 23:14:22 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D3DF20738;
        Mon,  7 Sep 2020 03:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599448462;
        bh=9KB0bHcYotxB3YAKwwtIMuZ6kgGLihRXb5A9qdvAp4U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WtjhZWxv9a7mkdrkKYE8rQ4iVz6yFF9O5Q+Bi+4F40I8zwYF5aGyxF/24sCbg+/Aj
         //8ZurLWjUxzXwyzFevGZeObsbenoAuFmPYA84198CPtJqSsbfH2NY9kF4CyoKrLKX
         dDHIW4S8OgXjYLfy6aMJpnmgLlg2mmsMk06EyUNs=
Date:   Mon, 7 Sep 2020 11:14:17 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the imx-mxs tree
Message-ID: <20200907031416.GT9261@dragon>
References: <20200907073409.622c6287@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907073409.622c6287@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 07, 2020 at 07:34:09AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   0f7242be58fe ("clk: imx: fix composite peripheral flags")
> 
> is missing a Signed-off-by from its committer.

Thanks for reporting, Stephen.  I just fixed it up.

Shawn
