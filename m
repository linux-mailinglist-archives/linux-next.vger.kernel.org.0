Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82401F010E
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 22:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbgFEUiv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Jun 2020 16:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728303AbgFEUiu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Jun 2020 16:38:50 -0400
X-Greylist: delayed 591 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 05 Jun 2020 13:38:50 PDT
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6C9C08C5C2
        for <linux-next@vger.kernel.org>; Fri,  5 Jun 2020 13:38:50 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 82BA23E92B;
        Fri,  5 Jun 2020 20:28:55 +0000 (UTC)
Subject: Re: linux-next: Signed-off-by missing for commit in the jc_docs tree
To:     Jonathan Corbet <corbet@lwn.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200526080122.5a91c78a@canb.auug.org.au>
 <20200526084451.69a3bd45@lwn.net>
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
Message-ID: <ba5ca7c6-bdf9-b568-b58e-d6d466dc668f@al2klimov.de>
Date:   Fri, 5 Jun 2020 22:28:54 +0200
MIME-Version: 1.0
In-Reply-To: <20200526084451.69a3bd45@lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
X-Spamd-Bar: /
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Am I completely blind or did the patch completely disappear?

$ git log v5.0..docs-5.8 |grep -Fwe 'Alexander A. Klimov'
$ git log v5.0..lwn/docs-next |grep -Fwe 'Alexander A. Klimov'
$ git log v5.0..lwn/docs-next-merge |grep -Fwe 'Alexander A. Klimov'
$ git log v5.0..torvalds/master |grep -Fwe 'Alexander A. Klimov'
$

Am 26.05.20 um 16:44 schrieb Jonathan Corbet:
> On Tue, 26 May 2020 08:01:22 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>> Commit
>>
>>    1fe411077207 ("Replace HTTP links with HTTPS ones: documentation")
>>
>> is missing a Signed-off-by from its author.
> 
> Argh, I don't know how I missed that.  Thanks for catching it, it will be
> fixed up.
> 
> jon
> 
