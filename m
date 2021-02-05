Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD3C3103DB
	for <lists+linux-next@lfdr.de>; Fri,  5 Feb 2021 04:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhBEDuf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Feb 2021 22:50:35 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2935 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhBEDuf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Feb 2021 22:50:35 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601cc0630000>; Thu, 04 Feb 2021 19:49:55 -0800
Received: from [10.2.60.31] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb
 2021 03:49:54 +0000
Subject: Re: [PATCH] xfs: fix unused variable build warning in xfs_log.c
To:     "Darrick J. Wong" <djwong@kernel.org>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        <linux-xfs@vger.kernel.org>,
        Linux Next <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Brian Foster <bfoster@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Allison Henderson <allison.henderson@oracle.com>
References: <20210205031814.414649-1-jhubbard@nvidia.com>
 <20210205033030.GL7193@magnolia>
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <11a20ea7-3d58-d102-0fcb-6bc92cfc86d5@nvidia.com>
Date:   Thu, 4 Feb 2021 19:49:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <20210205033030.GL7193@magnolia>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1612496995; bh=aVWP6jGi6yMses/G7c+2YFcawvLkfOUygGY3+F5TXgI=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=KWALDuMdgil2trdKyD9hNMG7KVtlXqK7G8/mnFLVzxIKItIhlT1O+MkL5vdgysNFN
         ckLMZyqhjMzE7YL0ZZoafYWo735tZBdeikGUWfjtCf3uj1NdxVDi25+gn6BbWd+4EL
         3Ln0AoNV2yXLFAbT9LMsExozEX5IMb0LzVVrEb2TwBRFHfwugSI1YVsbtn3kBxhe6c
         pF3ltoZ0xeF4sBSgsjPdZpPX5QVzF7NTwaE0iTh3wrjqhVIRsZKwy9OCw55cfrCJq0
         e3tXUK6bslFVoN2Wh7dGMImquZSG/z6LX+Wev0r9x0CW7+M2USLkAdzqJvOMZJTreN
         5MO65EV4Ww7pw==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/4/21 7:30 PM, Darrick J. Wong wrote:
> On Thu, Feb 04, 2021 at 07:18:14PM -0800, John Hubbard wrote:
>> Delete the unused "log" variable in xfs_log_cover().
>>
>> Fixes: 303591a0a9473 ("xfs: cover the log during log quiesce")
>> Cc: Brian Foster <bfoster@redhat.com>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Darrick J. Wong <djwong@kernel.org>
>> Cc: Allison Henderson <allison.henderson@oracle.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>> Hi,
>>
>> I just ran into this on today's linux-next, so here you go!
> 
> Thanks for the tipoff, I just realized with horror that I got the git
> push wrong and never actually updated xfs-linux.git#for-next.  This (and
> all the other gcc warnings) are fixed in "xfs-for-next" which ... is not
> for-next.
> 
> Sigh.....  so much for trying to get things in for testing. :(
> 
Well, if it's any consolation, this is the *only* warning that fired during
my particular build, in linux-next. :)


thanks,
-- 
John Hubbard
NVIDIA
