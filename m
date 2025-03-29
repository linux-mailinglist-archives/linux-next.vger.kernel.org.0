Return-Path: <linux-next+bounces-6082-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6F5A753B7
	for <lists+linux-next@lfdr.de>; Sat, 29 Mar 2025 01:27:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 867F8170A4B
	for <lists+linux-next@lfdr.de>; Sat, 29 Mar 2025 00:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C95F211C;
	Sat, 29 Mar 2025 00:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTgbREO2"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27861282F5;
	Sat, 29 Mar 2025 00:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743208009; cv=none; b=cLPfyYn7NJvZMmXhiIDVah2/Ef0dnte4kDNmJZz4k8w+2pUUZ61wdebpueSBAx0tTJYmVVRTVPjprbxyCB/NmCmHj7jq2Q/llPd5Q2HexZtLPsA7bpmR564xm2vTt4vyxdPjW0Tcg6PQJed9sZxn42nQrThFLzb5MB6SCst8FIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743208009; c=relaxed/simple;
	bh=fd3ZbmwuWPnTlAjRhYIp3TOykHG1yF4ccDS0y7wap3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pS61ED8t+MRC+TdKJzaSquY9jOI2A/ctLjXE1fA2d2iluZ5G5BdOXdKpNgqORwK1qqtLWNLhR3Xt5yPVlbTqEbm4dg3zJ5mrKSUV3pzPRsaABAoTn40s+q/Altfm+FUPdjIwX5cr9hhJdX52ccAtxmOPvcmqrgmo3VnZn9PwiX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTgbREO2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743208007; x=1774744007;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fd3ZbmwuWPnTlAjRhYIp3TOykHG1yF4ccDS0y7wap3E=;
  b=fTgbREO2phXJ7Uvh8+87EUBYdgjnexvQC2Wsuj16Nd7Dviv4/tBONzPI
   4PQPS7UJjYdPIa075OebxXLzRux4VSJ1NNrp/O8zMYBrky2X+O1rvb1rm
   AoYaa2gUinDXdwdDET6U4g5cyRjNA9TxOYAGFIcxaWfd6j8H2+8XSUDRN
   AuOhS6AUkfG7SckLPvuKEwwAlE3xME8dvATashLKJdpeG2XsmVcOpsKwZ
   wtLm2ZYErij9L0gfZdMu4vAeB5fM6tsXuQ59h8Xu0gSmGvs4YgQhl4rdW
   IRaviYqtedaTmQuXUfhQm5GWY0H4YyRlq6nP5XEqN2Z+BpkfdMvgfUGK1
   g==;
X-CSE-ConnectionGUID: CQmc27jWTV2dXPhSEV3oUw==
X-CSE-MsgGUID: DJMvcflbQ+GaFrywyD1Vug==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="62113508"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="62113508"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 17:26:46 -0700
X-CSE-ConnectionGUID: LN4pf5kGQsqcqRv/XPQE3g==
X-CSE-MsgGUID: sXK9fo/9S7iZDqx8HE79Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="156579138"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [10.125.108.185]) ([10.125.108.185])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 17:26:45 -0700
Message-ID: <1f48ba3b-9ba8-44e5-98c7-4c9abf95a935@intel.com>
Date: Fri, 28 Mar 2025 17:26:42 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error:
 uuid/uuid.h: No such file or directory
To: Dan Williams <dan.j.williams@intel.com>,
 "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-cxl@vger.kernel.org, dave@stgolabs.net,
 jonathan.cameron@huawei.com, alison.schofield@intel.com,
 vishal.l.verma@intel.com, ira.weiny@intel.com, gourry@gourry.net,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 sfr@canb.auug.org.au, Jason Gunthorpe <jgg@nvidia.com>
References: <f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop>
 <14bfcfa0-5999-49e4-854e-ff8810d6df3c@intel.com>
 <52a34c97-88d2-415e-a899-6583ae3ba620@paulmck-laptop>
 <30a7f782-4388-45b6-bb3c-a0faf85b7445@intel.com>
 <51e9823c-784c-4b91-99d4-0500aaf5cec0@paulmck-laptop>
 <67e7301dc8ad7_201f0294a5@dwillia2-xfh.jf.intel.com.notmuch>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <67e7301dc8ad7_201f0294a5@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/28/25 4:26 PM, Dan Williams wrote:
> Paul E. McKenney wrote:
> [..]
>>>> Making the above change got me this:
>>>>
>>>> usr/include/cxl/features.h:59:9: error: unknown type name ‘uuid_t’
>>> I wasn't able to hit that with allmodconfig on x86 with a Fedora 41 build setup. What is the specific command lines you are using?
>>
>> make clean
>> make allmodconfig
>> make -j$N
>>
>> Though encapsulated as follows:
>>
>> tools/testing/selftests/rcutorture/bin/torture.sh --do-none --do-allmodconfig
> 
> The problem is that uuid_t is not defined for uapi headers to reuse.
> Perhaps checkpatch should be checking for uuid_t in uapi headers going
> forward.
> 
> For now the following builds for me, but it is a quite a mess to undo
> the assumption that that the hardware object definitions can not use
> uuid_t:

+Jason.

> 
> -- 8< --
> diff --git a/drivers/cxl/core/features.c b/drivers/cxl/core/features.c
> index f4daefe3180e..d626dd7c5fbf 100644
> --- a/drivers/cxl/core/features.c
> +++ b/drivers/cxl/core/features.c
> @@ -33,7 +33,11 @@ static bool is_cxl_feature_exclusive_by_uuid(const uuid_t *uuid)
>  
>  static bool is_cxl_feature_exclusive(struct cxl_feat_entry *entry)
>  {
> -	return is_cxl_feature_exclusive_by_uuid(&entry->uuid);
> +	uuid_t uuid;
> +
> +	import_uuid(&uuid, entry->uuid);
> +
> +	return is_cxl_feature_exclusive_by_uuid(&uuid);
>  }
>  
>  inline struct cxl_features_state *to_cxlfs(struct cxl_dev_state *cxlds)
> @@ -228,7 +232,7 @@ size_t cxl_get_feature(struct cxl_mailbox *cxl_mbox, const uuid_t *feat_uuid,
>  		return 0;
>  
>  	size_out = min(feat_out_size, cxl_mbox->payload_size);
> -	uuid_copy(&pi.uuid, feat_uuid);
> +	export_uuid(pi.uuid, feat_uuid);
>  	pi.selection = selection;
>  	do {
>  		data_to_rd_size = min(feat_out_size - data_rcvd_size,
> @@ -282,7 +286,7 @@ int cxl_set_feature(struct cxl_mailbox *cxl_mbox,
>  	if (!pi)
>  		return -ENOMEM;
>  
> -	uuid_copy(&pi->uuid, feat_uuid);
> +	export_uuid(pi->uuid, feat_uuid);
>  	pi->version = feat_version;
>  	feat_flag &= ~CXL_SET_FEAT_FLAG_DATA_TRANSFER_MASK;
>  	feat_flag |= CXL_SET_FEAT_FLAG_DATA_SAVED_ACROSS_RESET;
> @@ -360,16 +364,19 @@ get_support_feature_info(struct cxl_features_state *cxlfs,
>  			 const struct fwctl_rpc_cxl *rpc_in)
>  {
>  	struct cxl_feat_entry *feat;
> -	const uuid_t *uuid;
> +	uuid_t in_uuid;
>  
> -	if (rpc_in->op_size < sizeof(uuid))
> +	if (rpc_in->op_size < sizeof(in_uuid))
>  		return ERR_PTR(-EINVAL);
>  
> -	uuid = &rpc_in->set_feat_in.uuid;
> +	import_uuid(&in_uuid, rpc_in->set_feat_in.uuid);
>  
>  	for (int i = 0; i < cxlfs->entries->num_features; i++) {
> +		uuid_t feat_uuid;
> +
>  		feat = &cxlfs->entries->ent[i];
> -		if (uuid_equal(uuid, &feat->uuid))
> +		import_uuid(&feat_uuid, feat->uuid);
> +		if (uuid_equal(&in_uuid, &feat_uuid))
>  			return feat;
>  	}
>  
> @@ -461,6 +468,7 @@ static void *cxlctl_get_feature(struct cxl_features_state *cxlfs,
>  	const struct cxl_mbox_get_feat_in *feat_in;
>  	u16 offset, count, return_code;
>  	size_t out_size = *out_len;
> +	uuid_t uuid;
>  
>  	if (rpc_in->op_size != sizeof(*feat_in))
>  		return ERR_PTR(-EINVAL);
> @@ -477,9 +485,10 @@ static void *cxlctl_get_feature(struct cxl_features_state *cxlfs,
>  	if (!rpc_out)
>  		return ERR_PTR(-ENOMEM);
>  
> -	out_size = cxl_get_feature(cxl_mbox, &feat_in->uuid,
> -				   feat_in->selection, rpc_out->payload,
> -				   count, offset, &return_code);
> +	import_uuid(&uuid, feat_in->uuid);
> +	out_size = cxl_get_feature(cxl_mbox, &uuid, feat_in->selection,
> +				   rpc_out->payload, count, offset,
> +				   &return_code);
>  	*out_len = sizeof(struct fwctl_rpc_cxl_out);
>  	if (!out_size) {
>  		rpc_out->size = 0;
> @@ -502,6 +511,7 @@ static void *cxlctl_set_feature(struct cxl_features_state *cxlfs,
>  	const struct cxl_mbox_set_feat_in *feat_in;
>  	size_t out_size, data_size;
>  	u16 offset, return_code;
> +	uuid_t uuid;
>  	u32 flags;
>  	int rc;
>  
> @@ -510,7 +520,8 @@ static void *cxlctl_set_feature(struct cxl_features_state *cxlfs,
>  
>  	feat_in = &rpc_in->set_feat_in;
>  
> -	if (is_cxl_feature_exclusive_by_uuid(&feat_in->uuid))
> +	import_uuid(&uuid, feat_in->uuid);
> +	if (is_cxl_feature_exclusive_by_uuid(&uuid))
>  		return ERR_PTR(-EPERM);
>  
>  	offset = le16_to_cpu(feat_in->offset);
> @@ -525,9 +536,9 @@ static void *cxlctl_set_feature(struct cxl_features_state *cxlfs,
>  	rpc_out->size = 0;
>  
>  	data_size = rpc_in->op_size - sizeof(feat_in->hdr);
> -	rc = cxl_set_feature(cxl_mbox, &feat_in->uuid,
> -			     feat_in->version, feat_in->feat_data,
> -			     data_size, flags, offset, &return_code);
> +	rc = cxl_set_feature(cxl_mbox, &uuid, feat_in->version,
> +			     feat_in->feat_data, data_size, flags, offset,
> +			     &return_code);
>  	if (rc) {
>  		rpc_out->retval = return_code;
>  		return no_free_ptr(rpc_out);
> diff --git a/include/uapi/cxl/features.h b/include/uapi/cxl/features.h
> index d6db8984889f..1e3323854994 100644
> --- a/include/uapi/cxl/features.h
> +++ b/include/uapi/cxl/features.h
> @@ -8,11 +8,6 @@
>  #define _UAPI_CXL_FEATURES_H_
>  
>  #include <linux/types.h>
> -#ifndef __KERNEL__
> -#include <uuid/uuid.h>
> -#else
> -#include <linux/uuid.h>
> -#endif
>  
>  /*
>   * struct cxl_mbox_get_sup_feats_in - Get Supported Features input
> @@ -60,7 +55,7 @@ struct cxl_mbox_get_sup_feats_in {
>   * Get Supported Features Supported Feature Entry
>   */
>  struct cxl_feat_entry {
> -	uuid_t uuid;
> +	__u8 uuid[16];
>  	__le16 id;
>  	__le16 get_feat_size;
>  	__le16 set_feat_size;
> @@ -110,7 +105,7 @@ struct cxl_mbox_get_sup_feats_out {
>   * CXL spec r3.2 section 8.2.9.6.2 Table 8-99
>   */
>  struct cxl_mbox_get_feat_in {
> -	uuid_t uuid;
> +	__u8 uuid[16];
>  	__le16 offset;
>  	__le16 count;
>  	__u8 selection;
> @@ -143,7 +138,7 @@ enum cxl_get_feat_selection {
>   */
>  struct cxl_mbox_set_feat_in {
>  	__struct_group(cxl_mbox_set_feat_hdr, hdr, /* no attrs */,
> -		uuid_t uuid;
> +		__u8 uuid[16];
>  		__le32 flags;
>  		__le16 offset;
>  		__u8 version;
> diff --git a/tools/testing/cxl/test/mem.c b/tools/testing/cxl/test/mem.c
> index f2957a3e36fe..d0276ab3a92f 100644
> --- a/tools/testing/cxl/test/mem.c
> +++ b/tools/testing/cxl/test/mem.c
> @@ -1397,7 +1397,7 @@ static int mock_activate_fw(struct cxl_mockmem_data *mdata,
>  
>  static void fill_feature_vendor_test(struct cxl_feat_entry *feat)
>  {
> -	feat->uuid = CXL_VENDOR_FEATURE_TEST;
> +	export_uuid(feat->uuid, &CXL_VENDOR_FEATURE_TEST);
>  	feat->id = 0;
>  	feat->get_feat_size = cpu_to_le16(0x4);
>  	feat->set_feat_size = cpu_to_le16(0x4);
> @@ -1441,8 +1441,10 @@ static int mock_get_feature(struct cxl_mockmem_data *mdata,
>  			    struct cxl_mbox_cmd *cmd)
>  {
>  	struct cxl_mbox_get_feat_in *input = cmd->payload_in;
> +	uuid_t in_uuid;
>  
> -	if (uuid_equal(&input->uuid, &CXL_VENDOR_FEATURE_TEST))
> +	import_uuid(&in_uuid, input->uuid);
> +	if (uuid_equal(&in_uuid, &CXL_VENDOR_FEATURE_TEST))
>  		return mock_get_test_feature(mdata, cmd);
>  
>  	cmd->return_code = CXL_MBOX_CMD_RC_UNSUPPORTED;
> @@ -1485,8 +1487,10 @@ static int mock_set_feature(struct cxl_mockmem_data *mdata,
>  			    struct cxl_mbox_cmd *cmd)
>  {
>  	struct cxl_mbox_set_feat_in *input = cmd->payload_in;
> +	uuid_t in_uuid;
>  
> -	if (uuid_equal(&input->hdr.uuid, &CXL_VENDOR_FEATURE_TEST))
> +	import_uuid(&in_uuid, input->hdr.uuid);
> +	if (uuid_equal(&in_uuid, &CXL_VENDOR_FEATURE_TEST))
>  		return mock_set_test_feature(mdata, cmd);
>  
>  	cmd->return_code = CXL_MBOX_CMD_RC_UNSUPPORTED;


