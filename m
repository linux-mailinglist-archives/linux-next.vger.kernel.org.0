Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4848C38C98F
	for <lists+linux-next@lfdr.de>; Fri, 21 May 2021 16:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232057AbhEUOzM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 May 2021 10:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232707AbhEUOzL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 May 2021 10:55:11 -0400
Received: from fieldses.org (fieldses.org [IPv6:2600:3c00:e000:2f7::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 822A7C061574;
        Fri, 21 May 2021 07:53:48 -0700 (PDT)
Received: by fieldses.org (Postfix, from userid 2815)
        id 78F2A64E8; Fri, 21 May 2021 10:53:47 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 78F2A64E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fieldses.org;
        s=default; t=1621608827;
        bh=MWQl651ojfljlKS37G9n/YAp/6aqfUyyInAhdRyeISQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yOOe2ueWbq7o36HCMqbQsLRrd0tn7nrzHIUzzG18mqrveZ1qAlCZdBJBHtFK2fV4D
         l8g67jhUmCsNx6WH/3B/EUb2ddmseKgMzARJMEnmVXVl9dq6JmFEt6E88HKtKVT/mE
         48mecmXD4nO8YG3I3mBw5VYwuf1zkplZxl1HgujI=
Date:   Fri, 21 May 2021 10:53:47 -0400
From:   "J. Bruce Fields" <bfields@fieldses.org>
To:     "Kornievskaia, Olga" <Olga.Kornievskaia@netapp.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the nfsd tree
Message-ID: <20210521145347.GC30314@fieldses.org>
References: <20210521080416.45f06cb8@canb.auug.org.au>
 <20210521135051.GA30314@fieldses.org>
 <EC2C4D09-8C52-4DDE-B21F-311219237DE4@netapp.com>
 <20210521140151.GB30314@fieldses.org>
 <091E9FDA-5268-4B8A-AD28-8876D54B395F@netapp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <091E9FDA-5268-4B8A-AD28-8876D54B395F@netapp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 21, 2021 at 02:42:53PM +0000, Kornievskaia, Olga wrote:
> [olga] Ah, thank you for figuring it out. Do you need another version
> or can you move the line?

I've fixed it, thanks.

--b.
