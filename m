Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFEB432A998
	for <lists+linux-next@lfdr.de>; Tue,  2 Mar 2021 19:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350282AbhCBSgf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Mar 2021 13:36:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234298AbhCBGTH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Mar 2021 01:19:07 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E6BEC061756;
        Mon,  1 Mar 2021 22:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=d2MqYRJZqPh/ig/USH9cDjBVqoJMcv2qSGD9YIsxUlQ=; b=DD/Efs2KfzSQdQ3nhGP8zSHcy9
        GGLhpF4Ti5rXapjckWXpyOCGlthkD5HJF2VuzIk72LooBlvFzIMT5MamifAExLdHosBoNnSjLMpN2
        E3Z6y3E6boDnWDndgy6sNKHgfYIhyzwRbvIaICHUu9TPy6dQ8Og3+7M17Qi/p1IwlhPjRVCvpCs4T
        cNol/qHvOl22dMWsdqjmWRAr4HH9ufPRLIsJtnJG5BZ72vyLjbNLUH+HrH3EtpB36nZthFI95k1Fl
        FdKwHMyaGnbBNQRraKgt6OY0ysBSS+rQ34xVVpZAx8X42gfs6sC+6wa1CVz9943JKchXUNR1V3nHz
        ddabJDaw==;
Received: from [2601:1c0:6280:3f0::3ba4]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1lGyLK-000107-IP; Tue, 02 Mar 2021 06:17:14 +0000
To:     LKML <linux-kernel@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Eric Snowberg <eric.snowberg@oracle.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: linux-next-20210302: build problems with certs
Message-ID: <e1c15c74-82ce-3a69-44de-a33af9b320ea@infradead.org>
Date:   Mon, 1 Mar 2021 22:17:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

I'm just guessing here, but I think that some of the certs build
infrastructure doesn't handle O=subdir, which is what I use all
of the time.

$ mkdir build64
$ make ARCH=x86_64 O=build64 all

  EXTRACT_CERTS   ../
At main.c:154:
- SSL error:0909006C:PEM routines:get_name:no start line: crypto/pem/pem_lib.c:745
extract-cert: ../: Is a directory
make[2]: [../certs/Makefile:119: certs/x509_revocation_list] Error 1 (ignored)


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
