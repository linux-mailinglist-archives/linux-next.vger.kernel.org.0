Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F15F214D2EC
	for <lists+linux-next@lfdr.de>; Wed, 29 Jan 2020 23:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgA2WSX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jan 2020 17:18:23 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:41614 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgA2WSX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jan 2020 17:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=g1xN3pkWgTiIog0aZR6ocu7odeQml1rb1vpE5DQa10I=; b=dRZ3NVX5DnCiK3wUCKQz95Ly7
        GcAWGsQMcJR6ipsCH1/++PKoQPrXTgWuaJ1U3G4vEW0MXXHGoM82xc1//NHKjIAB3a4Cd4wPKwLJl
        lsgHL3rFQsyVSARRF10jMF5fyG1qwrLorHVwrTM6q+WGbssh0E4xGJCThEmpiRLb1QvsZNHjaMdYT
        H+bLteE8w9ExY5qhYZaeUakav4gvWV+Vm7RYQPmoLQgEGbLGgtBK6eMgaR58ZNp2pEFjX5B6KzaCR
        ut7vl6u0fWfGRJeqxdkj246fhxNxBkdPvdKBHFPd/yVDlvxhVOTcBfyM+cUAHPRPI/2eHc4oozrWI
        c1iOefcEQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iwvfC-0003Tr-Ay; Wed, 29 Jan 2020 22:18:22 +0000
Subject: Re: linux-next: Tree for Jan 29 (security/smack/)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        linux-security-module <linux-security-module@vger.kernel.org>
References: <20200129155431.76bd7f25@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e66a563e-b612-c5b6-7bdd-b55113a9b822@infradead.org>
Date:   Wed, 29 Jan 2020 14:18:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200129155431.76bd7f25@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/28/20 8:54 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any v5.7 material to your linux-next included
> branches until after v5.6-rc1 has been released.
> 
> Changes since 20200128:
> 

../security/smack/smack_lsm.c: In function ‘smack_post_notification’:
../security/smack/smack_lsm.c:4383:7: error: dereferencing pointer to incomplete type ‘struct watch_notification’
  if (n->type == WATCH_TYPE_META)
       ^~
  CC      kernel/time/hrtimer.o
../security/smack/smack_lsm.c:4383:17: error: ‘WATCH_TYPE_META’ undeclared (first use in this function); did you mean ‘TCA_PIE_BETA’?
  if (n->type == WATCH_TYPE_META)
                 ^~~~~~~~~~~~~~~
                 TCA_PIE_BETA


Probably just missing
#include <linux/watch_queue.h>


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
