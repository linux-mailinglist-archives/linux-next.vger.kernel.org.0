Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC362117FDD
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2019 06:39:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbfLJFjp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Dec 2019 00:39:45 -0500
Received: from namei.org ([65.99.196.166]:36806 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726739AbfLJFjp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Dec 2019 00:39:45 -0500
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id xBA5dVTh028798;
        Tue, 10 Dec 2019 05:39:31 GMT
Date:   Tue, 10 Dec 2019 16:39:31 +1100 (AEDT)
From:   James Morris <jmorris@namei.org>
To:     Paul Moore <paul@paul-moore.com>
cc:     selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-next@vger.kernel.org, sds@tycho.nsa.gov,
        jamorris@linux.microsoft.com
Subject: Re: [RFC PATCH] security: add an interface to lookup the lockdown
 reason
In-Reply-To: <157594493094.748324.9234611948545428995.stgit@chester>
Message-ID: <alpine.LRH.2.21.1912101639140.28773@namei.org>
References: <157594493094.748324.9234611948545428995.stgit@chester>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 9 Dec 2019, Paul Moore wrote:

> With CONFIG_AUDIT enabled but CONFIG_SECURITY disabled we run into
> a problem where the lockdown reason table is missing.  This patch
> attempts to fix this by hiding the table behind a lookup function.
> 
> Signed-off-by: Paul Moore <paul@paul-moore.com>


Acked-by: James Morris <jamorris@linux.microsoft.com>

-- 
James Morris
<jmorris@namei.org>

