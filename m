Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5F7118BFA
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2019 16:06:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfLJPGm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Dec 2019 10:06:42 -0500
Received: from UPDC19PA24.eemsg.mail.mil ([214.24.27.199]:33921 "EHLO
        UPDC19PA24.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbfLJPGm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Dec 2019 10:06:42 -0500
X-Greylist: delayed 430 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Dec 2019 10:06:40 EST
X-EEMSG-check-017: 37072224|UPDC19PA24_ESA_OUT06.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.69,300,1571702400"; 
   d="scan'208";a="37072224"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
  by UPDC19PA24.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 10 Dec 2019 14:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1575989967; x=1607525967;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=ELb72ZR2Uh1TaMvJB/y5pi9a9pIUKU55hg21Xzcheas=;
  b=cYMvMJYfTahMkEGDxdxzXzMC/VJd4dfYryVPTnVyxdriFRg9Q7UMRsq5
   j6NsasI4j7RgQAQMtmj8KX8SxgCLwUJuCR3ylulCiSF60WcYKyIPy2vMb
   Jz0dDdULPBG2v1DGF7OkqqEVsd9DdAjAhoL0giM7fASkcZOGelJie2aiW
   UvxNdcYhZalp5hD04Q3fwEJeYkfGyfrjddLfqo3O15Ijkj/2jqr43YM95
   9k8Z9DN4Nm1Mqj5031Fa1pM/W8lAOXADWgUPOcn1G8CLSk4swm76ZOik0
   K4Uo1WrznW6nZUvodAilReSahve6jJCq25sVfO+mQ4/+h9H+8Grv247BV
   w==;
X-IronPort-AV: E=Sophos;i="5.69,300,1571702400"; 
   d="scan'208";a="30940234"
IronPort-PHdr: =?us-ascii?q?9a23=3AMdNI3hXhxXPwMjwyfZw/aXWznTXV8LGtZVwlr6?=
 =?us-ascii?q?E/grcLSJyIuqrYZRWBtKdThVPEFb/W9+hDw7KP9fy5AipZsM3K7iFKWacPfi?=
 =?us-ascii?q?dNsd8RkQ0kDZzNImzAB9muURYHGt9fXkRu5XCxPBsdMs//Y1rPvi/6tmZKSV?=
 =?us-ascii?q?3wOgVvO+v6BJPZgdip2OCu4Z3TZBhDiCagbb9oIxi6sAvcutMLjYZmJKs9xR?=
 =?us-ascii?q?rEr39VcOlK2G1kIk6ekQzh7cmq5p5j9CpQu/Ml98FeVKjxYro1Q79FAjk4Km?=
 =?us-ascii?q?45/MLkuwXNQguJ/XscT34ZkgFUDAjf7RH1RYn+vy3nvedgwiaaPMn2TbcpWT?=
 =?us-ascii?q?S+6qpgVRHlhDsbOzM/7WrakdJ7gr5Frx29phx/24/Ub5+TNPpiZaPWYNcWSX?=
 =?us-ascii?q?NcUspNSyBNB4WxYIUVD+oFIO1WsY/zqVUTphe6HAWhCufixjpOi3Tr36M1zv?=
 =?us-ascii?q?4hHBnb0gI+EdIAsHfaotv7O6gdU++60KbGwC7fb/5Uwzrx9JTEfx4jrPyKQL?=
 =?us-ascii?q?l+cdDRyU4qFw7dk1uQtZLqPyuV1usTtWiQ8vduVee1hG4jrwF+vDiuzdorh4?=
 =?us-ascii?q?nSm40V0UvJ9Tl5wYkpJd24T1R3Ydi/EJRKrS2aOIx2Qt07TmxupS00yaUGtI?=
 =?us-ascii?q?amcCUFx5kr3R7SZ+Gdf4SW7R/vSvydLSp+iXl4YrywnQyy/lKlyuDkU8m010?=
 =?us-ascii?q?tFoTRdn9nXs3ANywTT6s+aSvth5kuh2SiA1wTU6uxcPUA7j7DbK588wr4rjJ?=
 =?us-ascii?q?YTsELDHiHxmEXtkqCZal8o+vSo6uv7YrXmoYWQN4lohQHlLqsigMm/AeU8Mg?=
 =?us-ascii?q?QWXmib//qz1KH78EHkT7hHgec6n6nEvJzAO8gWqbC1DxVI3oo77hawFTam0N?=
 =?us-ascii?q?AWnXkdK1JFfQqKj5P0NFHVO/34Efe+jEiskDds3fzGOKbhDY/XInjMl7fhY6?=
 =?us-ascii?q?5x61RAxwor0dBf+5VUB6kZIP3pR0/xsMfVDgcjPAypx+brEdB91oQZWWKVHK?=
 =?us-ascii?q?CVKr/dsViN5ug3OemDeJcVuCrhK/gi//PulmE2mVscfamvwJsWZ2u1HuppI0?=
 =?us-ascii?q?qHe3rgmNQBHnkQvgo4UuPqjEeOUTlJZ3a9R6g8/C00CJq6DYffQYCgmLiB3C?=
 =?us-ascii?q?a9Hp1LaWFKE0uMHmn0eIWZQfcMaT6SI894njwBUriuVpIh1RWwuwLh1bpnIf?=
 =?us-ascii?q?Tb+jcCuZLgytd1/evTmg829TBuCMSdyW6NRXlunmwUXz82wLx/oUtlx1eH0K?=
 =?us-ascii?q?h4heFYFNNK6/NPTAg7OoLcwvdkC9D9RA3BZM2FSFW4TdW8BzE+UNYxz8UJY0?=
 =?us-ascii?q?ZnFNWolgrD0DayA78Ji7yLA4Q58qDG0Hj0IMZ90WzG1Kg6j1Q9RstPNGumhr?=
 =?us-ascii?q?Nw9gTJAo7JklmWl7ytdaQH2y7N+nuDwXCSs0FfVQ4jGZnCCEgWe0+eiNP+/E?=
 =?us-ascii?q?6KG6enFLAPKgJczYuHLaxQZ5viilAQAL/4NdDfZX+hs3m/CAzOxb6WaofuPW?=
 =?us-ascii?q?IH02GVDEkCjhBW5nuNKBI/GjbkpmXSEThjPUzgblmq8uRkrn6/CEguwFKkdU?=
 =?us-ascii?q?pkgoGp9wYViPrUcPYa2rYJqW91sDlvNEqs1NLRTdybrkxue7sKMoB120tOyW?=
 =?us-ascii?q?+M7181BZenNa03wwdFIgk=3D?=
X-IPAS-Result: =?us-ascii?q?A2ARAACise9d/wHyM5BlGgEBAQEBAQEBAQMBAQEBEQEBA?=
 =?us-ascii?q?QICAQEBAYFtAgEBAQELAYFzgW0gEiqEA4kDhmcBAQEBAQEGgTeJaZFGCQEBA?=
 =?us-ascii?q?QEBAQEBATcBAYRAAoInNwYOAhABAQEEAQEBAQEFAwEBbIVDgjspAYJ5AQEBA?=
 =?us-ascii?q?QIBIwQRQRALGAICJgICVwYBDAYCAQGCUww/glMFIKxcdX8zhU+DQoFIgQ4oA?=
 =?us-ascii?q?YwxeYEHgREnD4JdPodZgl4ElnxGlyKCOYI7ky8GG5o4jkqcQSOBWCsIAhgII?=
 =?us-ascii?q?Q+DJ1ARFIxyF45BIwMwjysBAQ?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil) ([144.51.242.1])
  by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 10 Dec 2019 14:59:26 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
        by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id xBAExBpx265470;
        Tue, 10 Dec 2019 09:59:11 -0500
Subject: Re: [RFC PATCH] security: add an interface to lookup the lockdown
 reason
To:     Paul Moore <paul@paul-moore.com>, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org
Cc:     linux-next@vger.kernel.org, jamorris@linux.microsoft.com
References: <157594493094.748324.9234611948545428995.stgit@chester>
From:   Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <285edbb5-b08e-5bdc-f951-841fe1d77521@tycho.nsa.gov>
Date:   Tue, 10 Dec 2019 09:59:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <157594493094.748324.9234611948545428995.stgit@chester>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/9/19 9:28 PM, Paul Moore wrote:
> With CONFIG_AUDIT enabled but CONFIG_SECURITY disabled we run into
> a problem where the lockdown reason table is missing.  This patch
> attempts to fix this by hiding the table behind a lookup function.

Shouldn't lsm_audit.c be conditional on both CONFIG_AUDIT and 
CONFIG_SECURITY?  When/why would we want it built without 
CONFIG_SECURITY enabled?

> 
> Signed-off-by: Paul Moore <paul@paul-moore.com>
> ---
>   include/linux/security.h |    7 +++++++
>   security/lsm_audit.c     |   12 +++++++++---
>   security/security.c      |    5 +++++
>   3 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 64b19f050343..295509a809d6 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -447,6 +447,8 @@ int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
>   int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen);
>   int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen);
>   int security_locked_down(enum lockdown_reason what);
> +const char *security_locked_reasonstr(enum lockdown_reason what);
> +
>   #else /* CONFIG_SECURITY */
>   
>   static inline int call_blocking_lsm_notifier(enum lsm_event event, void *data)
> @@ -1274,6 +1276,11 @@ static inline int security_locked_down(enum lockdown_reason what)
>   {
>   	return 0;
>   }
> +
> +static inline const char *security_locked_reasonstr(enum lockdown_reason what)
> +{
> +	return NULL;
> +}
>   #endif	/* CONFIG_SECURITY */
>   
>   #ifdef CONFIG_SECURITY_NETWORK
> diff --git a/security/lsm_audit.c b/security/lsm_audit.c
> index 2d2bf49016f4..519ef6046638 100644
> --- a/security/lsm_audit.c
> +++ b/security/lsm_audit.c
> @@ -426,10 +426,16 @@ static void dump_common_audit_data(struct audit_buffer *ab,
>   				 a->u.ibendport->dev_name,
>   				 a->u.ibendport->port);
>   		break;
> -	case LSM_AUDIT_DATA_LOCKDOWN:
> -		audit_log_format(ab, " lockdown_reason=");
> -		audit_log_string(ab, lockdown_reasons[a->u.reason]);
> +	case LSM_AUDIT_DATA_LOCKDOWN: {
> +		const char *str = security_locked_reasonstr(a->u.reason);
> +
> +		if (str) {
> +			audit_log_format(ab, " lockdown_reason=");
> +			audit_log_string(ab, str);
> +		} else
> +			audit_log_format(ab, " lockdown_reason=?");
>   		break;
> +	}
>   	} /* switch (a->type) */
>   }
>   
> diff --git a/security/security.c b/security/security.c
> index 2b5473d92416..2f228fdbebf5 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -2438,6 +2438,11 @@ int security_locked_down(enum lockdown_reason what)
>   }
>   EXPORT_SYMBOL(security_locked_down);
>   
> +const char *security_locked_reasonstr(enum lockdown_reason what)
> +{
> +	return lockdown_reasons[what];
> +}
> +
>   #ifdef CONFIG_PERF_EVENTS
>   int security_perf_event_open(struct perf_event_attr *attr, int type)
>   {
> 

